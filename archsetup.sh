if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

pacman -S --noconfirm --needed xdg-desktop-portal xdg-desktop-portal-wlr sway swaybg ly foot fuzzel git nvim ttf-jetbrains-mono-nerd wl-clipboard grim

cat <<'EOF' >/etc/sway/config.d/override.conf
default_border pixel 2
bindsym $mod+semicolon exec fuzzel
bindsym $mod+p exec 'grim - | wl-copy'

output * bg #000000 solid_color

input * {
    xkb_layout 'us,ua'
    xkb_options 'grp:alt_shift_toggle,caps:swapescape'
}

input type:touchpad {
       dwt enabled
       tap enabled
       natural_scroll disabled
       middle_emulation enabled
   }
include ~/.config/sway/*.conf
EOF
echo 'Sway is configured.'

mkdir -p /etc/xdg/foot/
cat <<'EOF' >/etc/xdg/foot/foot.ini
# -*- conf -*-
[main]
font=JetBrainsMonoNerdFont:size=10

[colors-dark]
alpha=0.75
background=000000
foreground=ffffff
EOF
echo 'Foot is configured.'

mkdir -p /etc/xdg/fuzzel/
cat <<'EOF' >/etc/xdg/fuzzel/fuzzel.ini
[main]
font=JetBrainsMonoNerdFont:size=10

[colors]
background=000000bf
text=ffffffff
EOF
echo 'Fuzzel is configured.'

echo 'Done.'
