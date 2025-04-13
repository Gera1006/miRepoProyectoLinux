#!/bin/bash

# Colores simples
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

# === Verificar que mpg123 esté instalado ===
if ! command -v mpg123 &> /dev/null; then
    echo -e "${YELLOW}El reproductor 'mpg123' no está instalado.${RESET}"
    read -p "¿Deseas instalarlo ahora? (s/n): " respuesta
    if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
        sudo apt update && sudo apt install -y mpg123
    else
        echo -e "${RED}No se puede continuar sin mpg123. Saliendo...${RESET}"
        exit 1
    fi
fi

# === Leer configuración de carpeta de música ===
CONFIG_FILE="./recursos/.config_musica"

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${YELLOW}No se encontró configuración de música.${RESET}"
    read -rp "Ingresa la ruta de tu carpeta de música: " music_dir
    echo "$music_dir" > "$CONFIG_FILE"
else
    music_dir=$(cat "$CONFIG_FILE")
fi

# === Verificar que la carpeta exista ===
if [ ! -d "$music_dir" ]; then
    echo -e "${RED}La carpeta '$music_dir' no existe.${RESET}"
    exit 2
fi

# === Obtener archivos .mp3 ===
mapfile -t songs < <(find "$music_dir" -type f -iname "*.mp3")

if [ ${#songs[@]} -eq 0 ]; then
    echo -e "${RED}No se encontraron archivos MP3 en '$music_dir'.${RESET}"
    exit 3
fi

# === Menú de reproducción ===
while true; do
    clear
    echo -e "${CYAN}🎵 Lista de canciones disponibles:${RESET}"
    for i in "${!songs[@]}"; do
        echo -e "${YELLOW}$((i+1))${RESET}) $(basename "${songs[$i]}")"
    done
    echo -e "${YELLOW}q${RESET}) Volver al menú principal"
    echo

    read -rp "Selecciona una canción por número o 'q' para volver: " opcion

    # Salida
    if [[ "$opcion" == "q" ]]; then
        echo -e "${GREEN}Regresando al menú principal...${RESET}"
        sleep 1
        break
    fi

    # Validación de número
    if ! [[ "$opcion" =~ ^[0-9]+$ ]] || (( opcion < 1 || opcion > ${#songs[@]} )); then
        echo -e "${RED}Entrada inválida. Intenta de nuevo.${RESET}"
        sleep 1.5
        continue
    fi

    seleccion="${songs[$((opcion-1))]}"

    clear
    echo -e "${GREEN}▶️ Reproduciendo:${RESET} $(basename "$seleccion")"
    echo -e "${CYAN}Pulsa Ctrl+C para detener la reproducción y volver al menú.${RESET}"
    sleep 1

    mpg123 "$seleccion"

    echo
    read -n1 -rsp $'Presiona cualquier tecla para volver al menú...\n'
done



