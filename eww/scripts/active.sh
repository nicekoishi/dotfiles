#!/usr/bin/env bash

hyprctl activewindow | rg "title: " | sed -e 's/title: //g' -e 's/\(.\{40\}\).*/\1.../' | head
