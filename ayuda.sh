#!/bin/bash

# ==========================
# Este comando muestra todos los comandos disponibles en la terminal personalizada,
# organizados por categoría, e incluye una versión extendida con detalles
# si el usuario lo desea.
# ==========================

# Definición de códigos de color para formato del texto. De esta forma se sigue un estilo consistente por categoría
TITLE="\e[1;36m"    # Color azul claro para títulos
CATEGORY="\e[1;35m" # Color magenta para nombres de categoría
COMMAND="\e[1;33m"  # Color amarillo para nombres de comandos
DESC="\e[0;37m"     # Color gris para descripciones
TIP="\e[32m"        # Color verde para tips
RESET="\e[0m"       # Resetea el color al valor por defecto, sirve para no afectar el resto del texto

clear  # Limpia la pantalla antes de mostrar contenido, haciendo que se vea más estética la ejecución del comando de ayuda

# Presenta una lista de comandos, separados por categoría para que el usuario pueda verlos fácilmente
echo -e "${TITLE}Comandos disponibles por categoría:${RESET}"
echo

# Muestra los comandos relacionados a utilidades del sistema
echo -e "${CATEGORY}🔧 Utilidades del sistema:${RESET}"
echo -e "  ${COMMAND}infosis${RESET}      ${DESC}- Muestra información técnica del sistema${RESET}"
echo -e "  ${COMMAND}fecha${RESET}        ${DESC}- Muestra la fecha y hora actuales${RESET}"
echo -e "  ${COMMAND}buscar${RESET}       ${DESC}- Busca un archivo en una carpeta específica${RESET}"
echo

# Muestra los comandos relacionados a navegación o información general ---
echo -e "${CATEGORY}🧭 Información y navegación:${RESET}"
echo -e "  ${COMMAND}ayuda${RESET}        ${DESC}- Muestra esta lista de comandos${RESET}"
echo -e "  ${COMMAND}creditos${RESET}     ${DESC}- Muestra información del programador${RESET}"
echo -e "  ${COMMAND}salir${RESET}        ${DESC}- Cierra la terminal personalizada${RESET}"
echo

# Muestra los comandos relacionados a entretenimiento
echo -e "${CATEGORY}🎮 Entretenimiento:${RESET}"
echo -e "  ${COMMAND}juego${RESET}        ${DESC}- Inicia un juego textual (por definir)${RESET}"
echo -e "  ${COMMAND}reproductor${RESET}  ${DESC}- Reproduce música desde tu biblioteca MP3${RESET}"

echo

# Muestra al usuario la opción de salir de la ayuda o ver más detalles de los comandos
echo -e "${DESC}Presiona cualquier tecla para ver detalles, o ${COMMAND}ESC${DESC} para volver a la terminal.${RESET}"
read -rsn1 input  # Captura una sola tecla sin mostrarla en pantalla

# Condición que verifica la tecla que presiona el usuario
# Si el usuario presiona ESC, sale de la ayuda
if [[ $input == $'\e' ]]; then
    clear
    echo -e "${TIP}Regresando a la terminal...${RESET}"
    sleep 0.5
    exit 0
fi
# Si el usuario presiona cualquier otra tecla, se muestra la descripción extendida de los comandos
# pues no se ejecuta el if anterior


# Limpia la pantalla para mostrar más detalles de los comandos
clear

# Entra a la descripción extendida de cada comando
echo -e "${TITLE}Descripción extendida de los comandos:${RESET}"
echo

# Explicación detallada de lo que hace cada comando
echo -e "${COMMAND}infosis${RESET}      - Muestra la RAM total, arquitectura del sistema y versión del sistema operativo."
echo -e "${COMMAND}fecha${RESET}        - Muestra la fecha y la hora actuales del sistema sin usar 'date'."
echo -e "${COMMAND}buscar${RESET}       - Busca un archivo por nombre dentro de un directorio. Pide la ruta y el nombre del archivo."
echo -e "${COMMAND}ayuda${RESET}        - Muestra esta guía con todos los comandos disponibles y consejos."
echo -e "${COMMAND}creditos${RESET}     - Muestra el nombre del programador con arte ASCII y animación."
echo -e "${COMMAND}salir${RESET}        - Comando exclusivo para salir de la terminal personalizada."
echo -e "${COMMAND}juego${RESET}        - Inicia el juego programado por el usuario. ¡Disfruta desde la línea de comandos!"
echo -e "${COMMAND}reproductor${RESET}  - Abre una interfaz gráfica simple para reproducir archivos MP3 desde tu carpeta de música."

echo
# Tips finales para el usuario
echo -e "${TIP}💡 TIP:${RESET} Para evitar errores cuando se te solicite una carpeta, coloca la ruta completa"
echo -e "Ejemplo: /home/usuario/Música/ o /home/usuario/Documentos/"
echo -e "${TIP}💡 TIP:${RESET} Todos los comandos están diseñados para ejecutarse dentro de tu terminal personalizada."
echo

# Espera final antes de regresar
read -rsp $'\nPresiona ENTER para regresar a la terminal personalizada' pause
clear



