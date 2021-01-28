# Pico-Hello
Copyright © 2021 Keith Packard

Pico-hello is a test application showing how to use picolibc in an
embedded application. It uses the meson subproject mechanism and
compiles picolibc for a single target.

## Dependencies

As pico-hello uses picolibc as a subproject, you won't need to have
that installed on your system. You will need an arm embedded
toolchain, the meson build system and the right version of qemu to run
the resulting binary. To install those on Debian (or Debian
derivative, like Ubuntu):

	$ sudo apt install gcc-arm-none-eabi meson qemu-system-arm

## Compiling and running pico-hello

I haven't figure out how to set the cross compile parameters
automatically, so there's a shell script with the necessary
parameters:

	$ sh ./autogen.sh

Running autogen.sh is equivalent to:

	$ meson --cross-file cross-cortex-m3.txt build

Once that has finished, you can build the project:

	$ cd build
	$ ninja

Assuming that has gone OK, you can now run the application:

	$ ../run-arm

This should print out some messages and then exit:

	hello world from picolibc version 1.5.1
		sin(1) = 0.841471
