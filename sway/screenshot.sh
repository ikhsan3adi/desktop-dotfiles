IMG=~/Pictures/Screenshots/$(date +'%s_grim.png')

if [ $1 = -g ]; then
  grim -g "$(slurp)" $IMG && wl-copy <$IMG
else
  grim $IMG && wl-copy <$IMG
fi
