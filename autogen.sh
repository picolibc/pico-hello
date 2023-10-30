#!/bin/sh
meson setup --cross-file 'cross-cortex-m3.txt' build "$@"
