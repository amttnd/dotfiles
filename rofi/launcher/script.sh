#!/usr/bin/env bash

if [[ ! `pidof rofi` ]]; then
  # Current Theme
  dir="$HOME/.config/rofi/launcher"
	## Run
  rofi \
    -show drun \
    -theme ${dir}/theme.rasi
fi
