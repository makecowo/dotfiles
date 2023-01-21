#!/usr/bin/env sh

# Terminate already running bar instances
polybar-msg cmd quit

# Launch polybar
polybar &
