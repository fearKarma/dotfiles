#!/bin/bash

killall -q polybar

polybar primary &
polybar secondary &
