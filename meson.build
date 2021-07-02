#
# SPDX-License-Identifier: BSD-3-Clause
#
# Copyright © 2021 Keith Packard
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.
#
project('pico-hello', 'c',
	default_options: [
	  'buildtype=minsize',
	  'debug=true',
	  'c_std=gnu99',
	  'b_staticpic=false',
	],
	license: 'BSD',
	meson_version: '>= 0.50',
	version: '0.1',
	cross: 'cross-cortex-m3.txt',
       )

picolibc_project = subproject('picolibc',
			      default_options: [
				'multilib=false'
			      ]
			     )

lib_crt = picolibc_project.get_variable('lib_crt')

lib_c = picolibc_project.get_variable('lib_c')

lib_semihost = picolibc_project.get_variable('lib_semihost')

inc = picolibc_project.get_variable('inc')

link_args = [
  '-T', '../pico-hello.ld',
  '-T', 'subprojects/picolibc/picolibc.ld',
  '-lgcc',
  '-Wl,-Map=pico-hello.map'
  ]

executable('pico-hello',
	   'pico-hello.c',
	   link_args: link_args,
	   link_with : [lib_crt, lib_c, lib_semihost],
	   include_directories: inc,
	   install : false)
