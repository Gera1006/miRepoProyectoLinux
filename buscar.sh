#!/bin/bash

# Colores
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# Mensaje de bienvenida si no hay argumentos
if [ "$#" -ne 2 ]; then
    echo -e "${YELLOW}Bienvenido al buscador de archivos.${RESET}"
    echo -e "${CYAN}Este script busca un archivo dentro de un directorio dado.${RESET}"
    echo
    read -p "Ingresa la ruta del directorio donde buscar: " directorio
    read -p "Ingresa el nombre del archivo que deseas buscar: " archivo
else
    directorio="$1"
    archivo="$2"
fi

# Verificar que el directorio exista
if [ ! -d "$directorio" ]; then
    echo -e "${RED}Error:${RESET} El directorio '${CYAN}$directorio${RESET}' no existe."
    exit 1
fi

# Buscar archivo (ignorando mayúsculas/minúsculas)
resultado=$(find "$directorio" -iname "$archivo")

# Resultado
if [ -z "$resultado" ]; then
    echo -e "${RED}Archivo '${archivo}' no encontrado en '${directorio}'.${RESET}"
    exit 2
else
    echo -e "${GREEN}Archivo encontrado en:${RESET}"
    echo -e "${CYAN}$resultado${RESET}"
    exit 0
fi
