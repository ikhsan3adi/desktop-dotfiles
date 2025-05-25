# remove annoying greeting
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$PATH:$HOME/.local/bin"

abbr --add c clear
abbr --add ff fastfetch

if test "$TERM" != linux
  oh-my-posh init fish --config ~/.config/oh-my-posh/ikhsan3adi-2.omp.json | source
end

if test "$TERM" = alacritty
  fastfetch
end