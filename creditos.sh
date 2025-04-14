#!/bin/bash

# ========================================
# Muestra los créditos del programador con arte ASCII y un efecto visual
# ========================================

# Definición de colores para resaltar el texto en la terminal
CYAN="\e[36m"     # Azul claro para descripciones
MAGENTA="\e[35m"  # Magenta para títulos
YELLOW="\e[33m"   # Amarillo para el nombre del autor
RED="\e[31m"      # Rojo para errores o advertencias
RESET="\e[0m"     # Reset al color por defecto

# Función que agrega el efecto 
# Toma una cadena de texto y la imprime carácter por carácter con una pausa
function escribir_lento() {
    texto="$1"
    for ((i=0; i<${#texto}; i++)); do
        echo -ne "${texto:$i:1}"  # Imprime sin salto de línea
        sleep 0.05                # Espera 0.05 segundos entre caracteres
    done
    echo                          # Imprime un salto de línea al final
}

# Limpia la terminal antes de mostrar los créditos
clear

# Verifica si figlet está instalado
if ! command -v figlet &> /dev/null; then
    echo -e "${YELLOW}El programa 'figlet' no está instalado.${RESET}"
    echo -e "Puedes instalarlo con: ${CYAN}sudo apt install figlet${RESET}"
    exit 1
fi

# Mostrar título principal con arte ASCII
echo -e "${MAGENTA}"             # Cambia el color a magenta
figlet "Creditos"                # Usa figlet para generar texto decorativo
echo -e "${RESET}"               # Restaura el color por defecto

# Mostrar autor con efecto
echo -e "${CYAN}"
escribir_lento "Desarrollado por:"
sleep 0.3                        # Pausa breve para efecto visual

# Mostrar nombre del programador con figlet
echo -e "${RED}"                 #  Cambia el color a rojo 
figlet "Luis Gerardo Arellano Cortes"
sleep 0.4                        # Pausa breve para efecto visual
echo -e "${RESET}"               # Restaura el color por defecto
echo -e "${CYAN}"                # Cambia el color a cyan
figlet "&"
echo -e "${RESET}"               # Restaura el color por defecto
sleep 0.4
echo -e "${YELLOW}"              # Cambia el color a amarillo
figlet "Carlos Emiliano Mendoza Hernandez"
echo -e "${RESET}"               # Restaura el color por defecto
sleep 0.5

# Muestra información adicional utilizando la función de efecto especial
echo -e "${CYAN}"
escribir_lento "Curso: Linux Gen 1"
sleep 0.3
escribir_lento "Proyecto: Terminal de Trabajo"
sleep 0.3
escribir_lento "Fecha: Abril 2025"
echo -e "${RESET}"

