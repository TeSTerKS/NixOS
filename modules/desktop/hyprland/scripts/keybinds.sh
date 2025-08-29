#!/usr/bin/env bash

if pidof rofi >/dev/null; then
  pkill rofi
fi

if pidof yad >/dev/null; then
  pkill yad
fi

# get_nix_value() {
#     grep "$1" "$HOME/NixOS/flake.nix" | sed -E 's/.*"([^"]+)".*/\1/'
# }
get_nix_value() {
    awk '
    /settings = {/ {inside_settings=1; next} 
    inside_settings && /}/ {inside_settings=0} 
    inside_settings && $0 ~ key {print gensub(/.*"([^"]+)".*/, "\\1", "g", $0)}
    ' key="$1" "$HOME/NixOS/flake.nix"
}


_browser=$(get_nix_value "browser =")
_terminal=$(get_nix_value "terminal =")
_terminal_FM=$(get_nix_value "terminalFileManager =")

yad \
  --center \
  --title="Hyprland Keybinds" \
  --no-buttons \
  --list \
  --width=745 \
  --height=920 \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --timeout-indicator=bottom \
  "SUPER Return" "Запуск Терминала" "$_terminal" \
  "SUPER T" "Запуск Терминала" "$_terminal" \
  "SUPER E" "Запуск файлового менеджера" "$_terminal_FM" \
  "SUPER F" "Запуск браузера" "$_browser" \
  "SUPER SHIFT S" "Запуск Spotify" "spotify" \
  "CTRL ALT Delete" "Системный мониторинг" "$_terminal -e 'btop'" \
  "SUPER A" "Запуск меню приложений" "scripts/rofi.sh drun" \
  "SUPER SPACE" "Запуск меню приложений" "scripts/rofi.sh drun" \
  "SUPER F9" "Включение Ночного режим" "hyprsunset --temperature 2500" \
  "SUPER F10" "Выключение Ночного режима" "pkill hyprsunset" \
  "SUPER F8" "Режимы autoclicker" "scripts/autoclicker.nix" \
  "SUPER CTRL C" "Colour picker" "hyprpicker --autocopy" \
  "SUPER, Left Click" "Движение окна мышкой" "movewindow" \
  "SUPER, Right Click" "Изменение размеров окна мышкой" "resizewindow" \
  "SUPER SHIFT →" "Изм. окна в право" "resizeactive 30 0" \
  "SUPER SHIFT ←" "Изм. окна в лево" "resizeactive -30 0" \
  "SUPER SHIFT ↑" "Изм. окна в верх" "resizeactive 0 -30" \
  "SUPER SHIFT ↓" "Изм. окна в низ" "resizeactive 0 30" \
  "SUPER SHIFT L" "Изм. окна в право (HJKL)" "resizeactive 30 0" \
  "SUPER SHIFT H" "Изм. окна в лево (HJKL)" "resizeactive -30 0" \
  "SUPER SHIFT K" "Изм. окна в верх (HJKL)" "resizeactive 0 -30" \
  "SUPER SHIFT J" "Изм. окна в низ (HJKL)" "resizeactive 0 30" \
  "XF86MonBrightnessDown" "Снижение яркости" "brightnessctl set 2%-" \
  "XF86MonBrightnessUp" "Повышение яркости" "brightnessctl set +2%" \
  "XF86AudioLowerVolume" "Понизить звук" "pamixer -d 2" \
  "XF86AudioRaiseVolume" "Повысить звук" "pamixer -i 2%" \
  "XF86AudioMicMute" "Выключить микрофон" "pamixer --default-source -t" \
  "XF86AudioMute" "Выключить аудио" "pamixer -t" \
  "XF86AudioPlay" "Play/Pause мультимедиа" "playerctl play-pause" \
  "XF86AudioNext" "Следующий трэк" "playerctl next" \
  "XF86AudioPrev" "Предыдущий трэк" "playerctl previous" \
  "SUPER Delete" "Выход из сессии Hyprland" "exit" \
  "SUPER W" "Переключить плавающее окно" "togglefloating" \
  "SUPER SHIFT G" "Переключить группу окон" "togglegroup" \
  "ALT Return" "Переключить на полный экран" "fullscreen" \
  "SUPER ALT L" "Экран блокировки" "hyprlock" \
  "SUPER Backspace" "Меню питания" "wlogout -b 4" \
  "CTRL Escape" "Переключить Waybar" "pkill waybar || waybar" \
  "SUPER SHIFT N" "Открыть панель уведомлений" "swaync-client -t -sw" \
  "SUPER SHIFT Q" "Открыть панель уведомлений" "swaync-client -t -sw" \
  "SUPER Q" "Закрыть активное окно" "scripts/dontkillsteam.sh" \
  "ALT F4" "Закрыть активное окно" "scripts/dontkillsteam.sh" \
  "SUPER Z" "Запуск emoji picker" "scripts/rofi.sh emoji" \
  "SUPER ALT K" "Change keyboard layout" "scripts/keyboardswitch.sh" \
  "SUPER U" "Rebuild system" "$_terminal -e scripts/rebuild.sh" \
  "SUPER G" "Game Ланчер" "scripts/rofi.sh games" \
  "SUPER ALT G" "Включить игровой режим" "scripts/gamemode.sh" \
  "SUPER V" "Clipboard manager" "scripts/ClipManager.sh" \
  "SUPER M" "Online music" "scripts/rofimusic.sh" \
  "SUPER P" "Screenshot (выбор области)" "scripts/screenshot.sh s" \
  "SUPER CTRL P" "Screenshot (Замороженная картинка)" "scripts/screenshot.sh sf" \
  "SUPER Print" "Screenshot (текущи монитор)" "scripts/screenshot.sh m" \
  "SUPER ALT P" "Screenshot (Все мониторы)" "scripts/screenshot.sh p" \
  "SUPER SHIFT CTRL ←" "Переместить окно left" "movewindow l" \
  "SUPER SHIFT CTRL →" "Переместить окно right" "movewindow r" \
  "SUPER SHIFT CTRL ↑" "Переместить окно up" "movewindow u" \
  "SUPER SHIFT CTRL ↓" "Переместить окно down" "movewindow d" \
  "SUPER CTRL S" "Переместить в блокнот" "movetoworkspacesilent special" \
  "SUPER S" "Переключить раб. пространство блокнота" "togglespecialworkspace" \
  "SUPER Tab" "Циклический перебор окон" "cyclenext" \
  "SUPER Tab" "Bring active window to top" "bringactivetotop" \
  "SUPER CTRL →" "Переключиться на след. раб. пространство" "workspace r+1" \
  "SUPER CTRL ←" "Переключиться на пред. раб. пространство" "workspace r-1" \
  "SUPER CTRL ↓" "Перейти на свободное. раб. пространствоto" "workspace empty" \
  "SUPER ←" "Переместить фокус left" "movefocus l" \
  "SUPER →" "Переместить фокус right" "movefocus r" \
  "SUPER ↑" "Переместить фокус up" "movefocus u" \
  "SUPER ↓" "Переместить фокус down" "movefocus d" \
  "ALT Tab" "Переместить фокус down" "movefocus d" \
  "SUPER 1-0" "Сменить  раб. пространства 1-10" "workspace 1-10" \
  "SUPER SHIFT 1-0" "Переместить на раб пространство 1-10" "movetoworkspace 1-10" \
  "SUPER SHIFT 1-0" "Silently move to workspace 1-10" "movetoworkspacesilent 1-10" \
