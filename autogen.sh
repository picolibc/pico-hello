#!/bin/sh
exec meson --cross-file 'cross-cortex-m3.txt' build "$@"
