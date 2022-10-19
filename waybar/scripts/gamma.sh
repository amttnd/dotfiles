#!/usr/bin/env bash

if [[ ! `pidof gammastep` ]]; then
	gammastep -PO 3500
else
	pkill gammastep
fi
