cpu_usage() {
  read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat

  total_now=$((user + nice + system + idle + iowait + irq + softirq + steal))
  idle_now=$((idle + iowait))

  if [[ -f /tmp/cpu_prev_stat ]]; then
    read -r total_prev idle_prev </tmp/cpu_prev_stat
    diff_total=$((total_now - total_prev))
    diff_idle=$((idle_now - idle_prev))

    if [ "$diff_total" -ne 0 ]; then
      usage=$((100 * (diff_total - diff_idle) / diff_total))
    else
      usage=0
    fi
  else
    usage=0
  fi

  echo "$total_now $idle_now" >/tmp/cpu_prev_stat

  echo "${usage}%"
}

while true; do
  date=$(date "+%A %d %b %Y %H:%M:%S")

  cpu_load=$(cpu_usage)
  cpu_temp=$(sensors | grep 'Tctl:' | awk '{gsub(/\+/, "", $2); print $2}')

  read mem_total mem_used <<<$(free -m | awk '/Mem:/ {print $2, $3}')
  mem_total_gb=$(awk "BEGIN {printf \"%.1f\", $mem_total/1024}")
  mem_used_gb=$(awk "BEGIN {printf \"%.1f\", $mem_used/1024}")
  mem_percent=$(awk "BEGIN {printf \"%.0f\", ($mem_used/$mem_total)*100}")
  mem="${mem_used_gb}/${mem_total_gb}GB (${mem_percent}%)"

  battery_level=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
  battery_level="${battery_level}%"
  charging=""
  if [ -f /sys/class/power_supply/AC/online ]; then
    ac_online=$(cat /sys/class/power_supply/AC/online)
    if [ "$ac_online" -eq 1 ]; then
      charging=" (charging)"
    fi
  fi
  battery="$battery_level$charging"

  volume_level=$(amixer get Master | grep -o -m 1 '[0-9]\+%')
  volume_status=$(amixer get Master | awk '/Front Left:/ || /Mono:/ { for (i=1; i<=NF; i++) if ($i ~ /\[on\]|\[off\]/) { gsub(/\[|\]/, "", $i); print $i; exit } }')
  volume="$volume_level ($volume_status)"

  net_info=$(nmcli -t -f TYPE,STATE,CONNECTION dev status | awk -F: '$2 == "connected" { print $1, $3; exit }')
  if [[ $net_info == wifi* ]]; then
    net_status="${net_info#wifi } (Wifi)"
  elif [[ $net_info == ethernet* ]]; then
    net_status="${net_info#ethernet } (Ethernet)"
  elif [[ $net_info == '' ]]; then
    net_status="(Disconnected)"
  else
    net_status="${net_info}"
  fi

  echo "CPU: $cpu_load @ $cpu_temp | Memory: $mem | Volume: $volume | $net_status | Battery: $battery | $date"

  sleep 0.5
done
