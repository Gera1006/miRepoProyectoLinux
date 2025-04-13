#!/bin/bash

# Colores
TITLE="\e[1;36m"
CATEGORY="\e[1;35m"
COMMAND="\e[1;33m"
DESC="\e[0;37m"
TIP="\e[32m"
RESET="\e[0m"

clear

# ==== SECCIÓN 1: CATEGORÍAS DE COMANDOS ====
echo -e "${TITLE}Comandos disponibles por categoría:${RESET}"
echo

# Categoría 1: Utilidades del sistema
echo -e "${CATEGORY}🔧 Utilidades del sistema:${RESET}"
echo -e "  ${COMMAND}infosis${RESET}      ${DESC}- Muestra información técnica del sistema${RESET}"
echo -e "  ${COMMAND}fecha${RESET}        ${DESC}- Muestra la fecha y hora actuales${RESET}"
echo -e "  ${COMMAND}buscar${RESET}       ${DESC}- Busca un archivo en una carpeta específica${RESET}"
echo

# Categoría 2: Información y navegación
echo -e "${CATEGORY}🧭 Información y navegación:${RESET}"
echo -e "  ${COMMAND}ayuda${RESET}        ${DESC}- Muestra esta lista de comandos${RESET}"
echo -e "  ${COMMAND}creditos${RESET}     ${DESC}- Muestra información del programador${RESET}"
echo -e "  ${COMMAND}salir${RESET}        ${DESC}- Cierra la terminal personalizada${RESET}"
echo

# Categoría 3: Entretenimiento
echo -e "${CATEGORY}🎮 Entretenimiento:${RESET}"
echo -e "  ${COMMAND}juego${RESET}        ${DESC}- Inicia un juego textual (gato o ahorcado)${RESET}"
echo -e "  ${COMMAND}reproductor${RESET}  ${DESC}- Reproduce música desde tu biblioteca MP3${RESET}"

echo
echo -e "${DESC}Presiona cualquier tecla para ver detalles, o ${COMMAND}ESC${DESC} para volver a la terminal.${RESET}"
read -rsn1 input  # Captura una sola tecla sin mostrarla

# Si la tecla es ESC, salir
if [[ $input == $'\e' ]]; then
    clear
    echo -e "${TIP}Regresando a la terminal...${RESET}"
    sleep 0.5
    exit 0
fi

clear

# ==== SECCIÓN 2: DESCRIPCIÓN DETALLADA DE LOS COMANDOS ====
echo -e "${TITLE}Descripción extendida de los comandos:${RESET}"
echo

echo -e "${COMMAND}infosis${RESET}      - Muestra la RAM total, arquitectura del sistema y versión del sistema operativo."
echo -e "${COMMAND}fecha${RESET}        - Muestra la fecha y la hora actuales del sistema sin usar 'date'."
echo -e "${COMMAND}buscar${RESET}       - Busca un archivo por nombre dentro de un directorio. Te pedirá la ruta y el nombre del archivo."
echo -e "${COMMAND}ayuda${RESET}        - Muestra esta guía con todos los comandos disponibles y consejos."
echo -e "${COMMAND}creditos${RESET}     - Muestra el nombre del programador con arte ASCII y animación."
echo -e "${COMMAND}salir${RESET}        - Comando exclusivo para salir de la terminal personalizada."
echo -e "${COMMAND}juego${RESET}        - Inicia el juego programado por el usuario. ¡Disfruta desde la línea de comandos!"
echo -e "${COMMAND}reproductor${RESET}  - Abre una interfaz gráfica simple para reproducir archivos MP3 desde tu carpeta de música."

echo
echo -e "${TIP}💡 TIP:${RESET} Puedes usar '~' para referirte a tu carpeta personal (ej: ~/Documentos)"
echo -e "${TIP}💡 TIP:${RESET} Todos los comandos están diseñados para ejecutarse dentro de tu terminal personalizada."
echo

# ==== Espera final para volver al menú ====
read -rsp $'\nPresiona ENTER para regresar a la terminal personalizada...' pause
clear



