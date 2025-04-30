source ~/.config/sway/colors.sh

swaylock \
  --fade-in 0.1 \
  --grace 2 \
  --screenshots \
  --indicator \
  --clock \
  \
  --timestr "%H:%M:%S" \
  --datestr "%a, %d %b %Y" \
  \
  --font "JetBrainsMono Nerd Font Propo" \
  \
  --indicator-idle-visible \
  --indicator-radius 200 \
  --indicator-thickness 1 \
  \
  --separator-color $transparent \
  \
  --text-color $fg0 \
  --text-clear-color $fg0 \
  --text-caps-lock-color $fg1 \
  --text-ver-color $fg1 \
  --text-wrong-color $bgurg \
  \
  --inside-color $transparent \
  --inside-clear-color $transparent \
  --inside-caps-lock-color $transparent \
  --inside-ver-color $transparent \
  --inside-wrong-color $transparent \
  \
  --key-hl-color $fg0 \
  --bs-hl-color $bgurg \
  --caps-lock-key-hl-color $fg0 \
  --caps-lock-bs-hl-color $bgurg \
  \
  --line-color $transparent \
  --line-clear-color $transparent \
  --line-caps-lock-color $transparent \
  --line-ver-color $transparent \
  --line-wrong-color $transparent \
  \
  --ring-color $transparent \
  --ring-clear-color $transparent \
  --ring-caps-lock-color $transparent \
  --ring-ver-color $transparent \
  --ring-wrong-color $transparent \
  \
  --effect-blur 5x5 \
  --effect-pixelate 5 \
  --effect-vignette 0.5:0.7 \
  $1
