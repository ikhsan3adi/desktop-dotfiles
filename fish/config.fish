# remove annoying greeting
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$PATH:$HOME/.local/bin"

export ANDROID_HOME="/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

export JAVA_HOME="/usr/lib/jvm/default"

export CHROME_EXECUTABLE="/sbin/thorium-browser"

abbr --add c clear
abbr --add ff fastfetch

if test "$TERM" != linux
  oh-my-posh init fish --config ~/.config/oh-my-posh/dydx-frappe.omp.json | source
end

if test "$TERM" = alacritty
  fastfetch
end