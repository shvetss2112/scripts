APP_DIR="$HOME/.local/share/applications"
CHROMIUM_EXEC=${CHROMIUM_EXEC:-'chromium'}

mkdir -p $APP_DIR

cat <<EOF >${APP_DIR}/music.desktop
[Desktop Entry]
Name=Music
Exec=sh -c "$CHROMIUM_EXEC --profile-directory=music-profile --app=https://music.youtube.com"
EOF
