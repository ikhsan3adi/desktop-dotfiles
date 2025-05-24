#!/bin/sh

# latitude,longitude
latlng="-4.018425024221436,120.78071864110255"
# url encoded
location="Sulawesi,%20Indonesia"

for i in {1..5}; do
    text=$(curl -s "https://wttr.in/$latlng?format=%t++%h+H")
    if [ $? -eq 0 ]; then
        tooltip=$(curl -s "https://wttr.in/$latlng?format=$location:+%C+%c\rTemperature:+%t\rHumidity:+%h")
        if [ $? -eq 0 ]; then
            # extract temperature value
            temperature=$(echo "$text" | grep -oE '[+-]?[0-9]+' | head -n 1)
            # remove leading + sign if its +
            if [ "${temperature:0:1}" = "+" ]; then
                temperature=${temperature#?}
            fi
            # remove trailing °C
            temperature=${temperature%°C}
            # remove leading space
            temperature=${temperature# }
            # remove trailing space
            temperature=${temperature% }
            # set class based on temperature
            if [ "$temperature" -lt 18 ]; then
                class="cold"
            elif [ "$temperature" -lt 25 ]; then
                class="cool"
            elif [ "$temperature" -lt 29 ]; then
                class="normal"
            elif [ "$temperature" -lt 32 ]; then
                class="warm"
            else
                class="hot"
            fi
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\", \"class\":\"$class\"}"
            exit
        fi
    fi
    sleep 2
done
echo "{\"text\":\"wttr: N/A\", \"tooltip\":\"Weather report: not found\", \"class\":\"hot\"}"
