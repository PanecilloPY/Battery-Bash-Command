#!/bin/bash

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)  # Estado de la batería

# Determinar el color según el nivel de batería
if [ "$BATTERY_LEVEL" -ge 80 ]; then
    COLOR="\033[32m"  # Verde
elif [ "$BATTERY_LEVEL" -ge 60 ]; then
    COLOR="\033[32m"  # Verde claro
elif [ "$BATTERY_LEVEL" -ge 40 ]; then
    COLOR="\033[33m"  # Amarillo
elif [ "$BATTERY_LEVEL" -ge 20 ]; then
    COLOR="\033[33m"  # Naranja
else
    COLOR="\033[31m"  # Rojo
fi

FULL_BLOCK="█"
EMPTY_BLOCK="░"
BAR_LENGTH=10  # Longitud total de la barra

FILLED_BLOCKS=$(( (BATTERY_LEVEL * BAR_LENGTH) / 100 ))
EMPTY_BLOCKS=$(( BAR_LENGTH - FILLED_BLOCKS ))

BAR=""
for ((i = 0; i < FILLED_BLOCKS; i++)); do
    BAR+="$FULL_BLOCK"
done
for ((i = 0; i < EMPTY_BLOCKS; i++)); do
    BAR+="$EMPTY_BLOCK"
done

# Determinar si la batería está cargando o no
if [[ "$BATTERY_STATUS" == "Charging" ]]; then
    STATUS_MSG="⚡ Cargando"
elif [[ "$BATTERY_STATUS" == "Full" ]]; then
    STATUS_MSG="🔋 Carga completa"
else
    STATUS_MSG="🔋 No se está cargando"
fi

# Mostrar el resultado
echo -e "\n${COLOR}[+] Batería: $BATTERY_LEVEL% | $BAR | $STATUS_MSG\033[0m"
