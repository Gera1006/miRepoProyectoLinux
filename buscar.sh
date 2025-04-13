#!/bin/bash

# ======================================
# Es script busca un archivo dentro de un directorio especificado por el usuario.
# Tiene dos formas de ejecución:
# Forma 1: ./buscar.sh [directorio] [nombre_del_archivo]
# Forma 2: si no se proporcionan argumentos, el script pedirá los datos de forma interactiva.
# ======================================

# Definición de colores para mensajes en la terminal
RED="\e[31m"     # Rojo para errores
GREEN="\e[32m"   # Verde para mensajes de éxito
YELLOW="\e[33m"  # Amarillo para advertencias o bienvenida
CYAN="\e[36m"    # Cyan para resaltar rutas o nombres
RESET="\e[0m"    # Reset al color por defecto

# En esta parte se verifican los argumentos al ejecutar el programa:
# Si el usuario no proporciona los dos argumentos requeridos, se activará el modo interactivo

if [ "$#" -ne 2 ]; then #Esto verifica si no se pasaron exactamente 2 argumentos
    echo -e "${YELLOW}Bienvenido al buscador de archivos.${RESET}"
    echo -e "${CYAN}Este script busca un archivo dentro de un directorio dado.${RESET}"
    echo
    read -p "Ingresa la ruta del directorio donde buscar: " directorio
    read -p "Ingresa el nombre del archivo que deseas buscar: " archivo
else
    # Si se pasaron correctamente los dos argumentos desde el principio, se asignan a las variables correspondientes
    directorio="$1"
    archivo="$2"
fi

# Esta es la sección de verificación de la existencia del directorio
# Si la ruta ingresada no corresponde a un directorio válido, se muestra un mensaje de error
if [ ! -d "$directorio" ]; then
    echo -e "${RED}Error:${RESET} El directorio '${CYAN}$directorio${RESET}' no existe."
    exit 1
fi

# Se usa 'find' para buscar el archivo dentro del directorio
# La opción -iname permite ignorar mayúsculas/minúsculas durante la búsqueda
resultado=$(find "$directorio" -iname "$archivo")

# Verificación del resultado de la búsqueda
if [ -z "$resultado" ]; then
    # Si la variable está vacía, el archivo no fue encontrado
    echo -e "${RED}Archivo '${archivo}' no encontrado en '${directorio}'.${RESET}"
    exit 2 # Salida con código de error 2
else
    # Si se encontró el archivo, se muestra la ruta completa
    echo -e "${GREEN}Archivo encontrado en:${RESET}"
    echo -e "${CYAN}$resultado${RESET}"
    exit 0 # Salida exitosa
fi
