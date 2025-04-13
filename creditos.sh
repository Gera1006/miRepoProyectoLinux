#!/bin/bash

# Colores
CYAN="\e[36m"
MAGENTA="\e[35m"
YELLOW="\e[33m"
RESET="\e[0m"

# Verifica si figlet está instalado
if ! command -v figlet &> /dev/null; then
    echo -e "${YELLOW}El programa 'figlet' no está instalado.${RESET}"
    echo -e "Puedes instalarlo con: ${CYAN}sudo apt install figlet${RESET}"
    echo
    echo -e "${MAGENTA}Créditos del programador:${RESET}"
    echo -e "${CYAN}Nombre:${RESET} [Luis Gerardo Arellano Cortes]"
    echo -e "${CYAN}Proyecto:${RESET} Terminal Bash Linux"
else
    clear
    echo -e "${MAGENTA}"
    figlet "Creditos"
    echo -e "${RESET}"
    echo -e "${CYAN}Desarrollado por:${RESET}"
    echo -e "${YELLOW}"
    figlet "Gerardo Arellano"
    figlet "&"
    figlet "Emiliano"
    echo -e "${RESET}"
    echo -e "${MAGENTA}Curso:${RESET} Linux Gen 1"
    echo -e "${MAGENTA}Proyecto:${RESET} Terminal de Trabajo"
    echo -e "${MAGENTA}Fecha:${RESET} Abril 2025"
fi
