#!/usr/bin/env bash

if [[ ! `pidof rofi` ]]; then
  # Current Theme
  dir="$HOME/.config/rofi/powermenu"

  # CMDs
  uptime="`uptime -p | sed -e 's/up //g'`"
  host=`hostnamectl hostname`

  # Options
  shutdown='襤 Shutdown'
  reboot='勒 Restart'
  suspend=' Sleep'
  yes=' Yes'
  no=' No'

  # Rofi CMD
  rofi_cmd() {
    rofi -dmenu \
      -p "$host" \
      -mesg "Uptime: $uptime" \
      -theme ${dir}/theme.rasi
  }

  # Confirmation CMD
  confirm_cmd() {
    rofi -dmenu \
      -p 'Confirmation' \
      -mesg 'Are you Sure?' \
      -theme $HOME/.config/rofi/shared/confirm.rasi
  }

  # Ask for confirmation
  confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
  }

  # Pass variables to rofi dmenu
  run_rofi() {
    echo -e "$suspend\n$reboot\n$shutdown" | rofi_cmd
  }

  # Execute Command
  run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
      if [[ $1 == '--shutdown' ]]; then
        systemctl poweroff
      elif [[ $1 == '--reboot' ]]; then
        systemctl reboot
      elif [[ $1 == '--suspend' ]]; then
        systemctl suspend
      fi
    else
      exit 0
    fi
  }

  # Actions
  chosen="$(run_rofi)"
  case ${chosen} in
    $shutdown)
      run_cmd --shutdown
      ;;
    $reboot)
      run_cmd --reboot
      ;;
    $suspend)
      run_cmd --suspend
      ;;
  esac
fi
