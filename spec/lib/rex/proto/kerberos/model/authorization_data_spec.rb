# -*- coding:binary -*-
require 'spec_helper'

require 'rex/proto/kerberos'

describe Rex::Proto::Kerberos::Model::AuthorizationData do

  subject(:authorization_data) do
    described_class.new
  end

  let(:pac_data) do
    "\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\xB0\x01\x00\x00H\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x12\x00\x00\x00\xF8\x01\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x14\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x14\x00\x00\x00(\x02\x00\x00\x00\x00\x00\x00\x01\x10\b\x00\xCC\xCC\xCC\xCC\xA0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x80\xF1\xE2i\xB5\x19\xD0\x01\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\b\x00\b\x00\x04\x00\x02\x00\x00\x00\x00\x00\b\x00\x02\x00\x00\x00\x00\x00\f\x00\x02\x00\x00\x00\x00\x00\x10\x00\x02\x00\x00\x00\x00\x00\x14\x00\x02\x00\x00\x00\x00\x00\x18\x00\x02\x00\x00\x00\x00\x00\xE8\x03\x00\x00\x01\x02\x00\x00\x05\x00\x00\x00\x1C\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00 \x00\x02\x00\x14\x00\x14\x00$\x00\x02\x00(\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x01\x02\x00\x00\a\x00\x00\x00\x00\x02\x00\x00\a\x00\x00\x00\b\x02\x00\x00\a\x00\x00\x00\x06\x02\x00\x00\a\x00\x00\x00\a\x02\x00\x00\a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00D\x00E\x00M\x00O\x00.\x00L\x00O\x00C\x00A\x00L\x00\x04\x00\x00\x00\x01\x04\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\x03\x99\xA8h\xE0\x0E\x0E\xD9\x9A\x18\xCF\xCF\x80\xF1\xE2i\xB5\x19\xD0\x01\b\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x8B$M`\xA5'\x9E\x8F_\x9B\xB6.\xF1\x1E\xF3\xC6\x00\x00\x00\x00\a\x00\x00\x00\xF3\x94&\xC3\tH\xD6\xC8yJ7\xED\xEF\t\xAA\xFD\x00\x00\x00\x00"
  end

  let(:pac_type_id) do
    128
  end

  let(:ad_if_relevant) do
    1
  end

=begin
#<OpenSSL::ASN1::Sequence:0x007fef1292f960
 @infinite_length=false,
 @tag=16,
 @tag_class=:UNIVERSAL,
 @tagging=nil,
 @value=
  [#<OpenSSL::ASN1::Sequence:0x007fef1292f988
    @infinite_length=false,
    @tag=16,
    @tag_class=:UNIVERSAL,
    @tagging=nil,
    @value=
     [#<OpenSSL::ASN1::ASN1Data:0x007fef1292fa50
       @infinite_length=false,
       @tag=0,
       @tag_class=:CONTEXT_SPECIFIC,
       @value=
        [#<OpenSSL::ASN1::Integer:0x007fef1292fa78
          @infinite_length=false,
          @tag=2,
          @tag_class=:UNIVERSAL,
          @tagging=nil,
          @value=#<OpenSSL::BN:0x007fef1292faa0>>]>,
      #<OpenSSL::ASN1::ASN1Data:0x007fef1292f9b0
       @infinite_length=false,
       @tag=1,
       @tag_class=:CONTEXT_SPECIFIC,
       @value=
        [#<OpenSSL::ASN1::OctetString:0x007fef1292f9d8
          @infinite_length=false,
          @tag=4,
          @tag_class=:UNIVERSAL,
          @tagging=nil,
          @value=
           "\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\xB0\x01\x00\x00H\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x12\x00\x00\x00\xF8\x01\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x14\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x14\x00\x00\x00(\x02\x00\x00\x00\x00\x00\x00\x01\x10\b\x00\xCC\xCC\xCC\xCC\xA0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x80\xF1\xE2i\xB5\x19\xD0\x01\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\b\x00\b\x00\x04\x00\x02\x00\x00\x00\x00\x00\b\x00\x02\x00\x00\x00\x00\x00\f\x00\x02\x00\x00\x00\x00\x00\x10\x00\x02\x00\x00\x00\x00\x00\x14\x00\x02\x00\x00\x00\x00\x00\x18\x00\x02\x00\x00\x00\x00\x00\xE8\x03\x00\x00\x01\x02\x00\x00\x05\x00\x00\x00\x1C\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00 \x00\x02\x00\x14\x00\x14\x00$\x00\x02\x00(\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x01\x02\x00\x00\a\x00\x00\x00\x00\x02\x00\x00\a\x00\x00\x00\b\x02\x00\x00\a\x00\x00\x00\x06\x02\x00\x00\a\x00\x00\x00\a\x02\x00\x00\a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00D\x00E\x00M\x00O\x00.\x00L\x00O\x00C\x00A\x00L\x00\x04\x00\x00\x00\x01\x04\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\x03\x99\xA8h\xE0\x0E\x0E\xD9\x9A\x18\xCF\xCF\x80\xF1\xE2i\xB5\x19\xD0\x01\b\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x8B$M`\xA5'\x9E\x8F_\x9B\xB6.\xF1\x1E\xF3\xC6\x00\x00\x00\x00\a\x00\x00\x00\xF3\x94&\xC3\tH\xD6\xC8yJ7\xED\xEF\t\xAA\xFD\x00\x00\x00\x00">]>]>]>
=end
  let(:simple) do
    "\x30\x82\x02\x52\x30\x82\x02\x4e\xa0\x04\x02\x02\x00\x80\xa1\x82\x02\x44\x04\x82" +
    "\x02\x40\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\xb0\x01\x00\x00\x48\x00" +
    "\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x12\x00\x00\x00\xf8\x01\x00\x00\x00\x00" +
    "\x00\x00\x06\x00\x00\x00\x14\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\x07\x00" +
    "\x00\x00\x14\x00\x00\x00\x28\x02\x00\x00\x00\x00\x00\x00\x01\x10\x08\x00\xcc\xcc" +
    "\xcc\xcc\xa0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x80\xf1\xe2\x69\xb5\x19" +
    "\xd0\x01\xff\xff\xff\xff\xff\xff\xff\x7f\xff\xff\xff\xff\xff\xff\xff\x7f\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\xff\xff" +
    "\xff\x7f\x08\x00\x08\x00\x04\x00\x02\x00\x00\x00\x00\x00\x08\x00\x02\x00\x00\x00" +
    "\x00\x00\x0c\x00\x02\x00\x00\x00\x00\x00\x10\x00\x02\x00\x00\x00\x00\x00\x14\x00" +
    "\x02\x00\x00\x00\x00\x00\x18\x00\x02\x00\x00\x00\x00\x00\xe8\x03\x00\x00\x01\x02" +
    "\x00\x00\x05\x00\x00\x00\x1c\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x02\x00\x14\x00" +
    "\x14\x00\x24\x00\x02\x00\x28\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x02" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00" +
    "\x00\x00\x6a\x00\x75\x00\x61\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x01\x02\x00\x00\x07\x00" +
    "\x00\x00\x00\x02\x00\x00\x07\x00\x00\x00\x08\x02\x00\x00\x07\x00\x00\x00\x06\x02" +
    "\x00\x00\x07\x00\x00\x00\x07\x02\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x44\x00" +
    "\x45\x00\x4d\x00\x4f\x00\x2e\x00\x4c\x00\x4f\x00\x43\x00\x41\x00\x4c\x00\x04\x00" +
    "\x00\x00\x01\x04\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\x03\x99\xa8\x68\xe0\x0e" +
    "\x0e\xd9\x9a\x18\xcf\xcf\x80\xf1\xe2\x69\xb5\x19\xd0\x01\x08\x00\x6a\x00\x75\x00" +
    "\x61\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x8b\x24\x4d\x60\xa5\x27" +
    "\x9e\x8f\x5f\x9b\xb6\x2e\xf1\x1e\xf3\xc6\x00\x00\x00\x00\x07\x00\x00\x00\xf3\x94" +
    "\x26\xc3\x09\x48\xd6\xc8\x79\x4a\x37\xed\xef\x09\xaa\xfd\x00\x00\x00\x00"
  end

=begin
#<OpenSSL::ASN1::Sequence:0x007fef109931d8
 @infinite_length=false,
 @tag=16,
 @tag_class=:UNIVERSAL,
 @tagging=nil,
 @value=
  [#<OpenSSL::ASN1::Sequence:0x007fef10993228
    @infinite_length=false,
    @tag=16,
    @tag_class=:UNIVERSAL,
    @tagging=nil,
    @value=
     [#<OpenSSL::ASN1::ASN1Data:0x007fef10993390
       @infinite_length=false,
       @tag=0,
       @tag_class=:CONTEXT_SPECIFIC,
       @value=
        [#<OpenSSL::ASN1::Integer:0x007fef109933b8
          @infinite_length=false,
          @tag=2,
          @tag_class=:UNIVERSAL,
          @tagging=nil,
          @value=#<OpenSSL::BN:0x007fef10993408>>]>,
      #<OpenSSL::ASN1::ASN1Data:0x007fef10993250
       @infinite_length=false,
       @tag=1,
       @tag_class=:CONTEXT_SPECIFIC,
       @value=
        [#<OpenSSL::ASN1::OctetString:0x007fef109932c8
          @infinite_length=false,
          @tag=4,
          @tag_class=:UNIVERSAL,
          @tagging=nil,
          @value=
           "0\x82\x02R0\x82\x02N\xA0\x04\x02\x02\x00\x80\xA1\x82\x02D\x04\x82\x02@\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\xB0\x01\x00\x00H\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x12\x00\x00\x00\xF8\x01\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x14\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x14\x00\x00\x00(\x02\x00\x00\x00\x00\x00\x00\x01\x10\b\x00\xCC\xCC\xCC\xCC\xA0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x80\xF1\xE2i\xB5\x19\xD0\x01\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x7F\b\x00\b\x00\x04\x00\x02\x00\x00\x00\x00\x00\b\x00\x02\x00\x00\x00\x00\x00\f\x00\x02\x00\x00\x00\x00\x00\x10\x00\x02\x00\x00\x00\x00\x00\x14\x00\x02\x00\x00\x00\x00\x00\x18\x00\x02\x00\x00\x00\x00\x00\xE8\x03\x00\x00\x01\x02\x00\x00\x05\x00\x00\x00\x1C\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00 \x00\x02\x00\x14\x00\x14\x00$\x00\x02\x00(\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x01\x02\x00\x00\a\x00\x00\x00\x00\x02\x00\x00\a\x00\x00\x00\b\x02\x00\x00\a\x00\x00\x00\x06\x02\x00\x00\a\x00\x00\x00\a\x02\x00\x00\a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00\x00\x00\x00\x00\n\x00\x00\x00D\x00E\x00M\x00O\x00.\x00L\x00O\x00C\x00A\x00L\x00\x04\x00\x00\x00\x01\x04\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\x03\x99\xA8h\xE0\x0E\x0E\xD9\x9A\x18\xCF\xCF\x80\xF1\xE2i\xB5\x19\xD0\x01\b\x00j\x00u\x00a\x00n\x00\x00\x00\x00\x00\x00\x00\a\x00\x00\x00\x8B$M`\xA5'\x9E\x8F_\x9B\xB6.\xF1\x1E\xF3\xC6\x00\x00\x00\x00\a\x00\x00\x00\xF3\x94&\xC3\tH\xD6\xC8yJ7\xED\xEF\t\xAA\xFD\x00\x00\x00\x00">]>]>]>
=end
  let(:nested) do
    "\x30\x82\x02\x67\x30\x82\x02\x63\xa0\x03\x02\x01\x01\xa1\x82\x02\x5a\x04\x82\x02" +
    "\x56\x30\x82\x02\x52\x30\x82\x02\x4e\xa0\x04\x02\x02\x00\x80\xa1\x82\x02\x44\x04" +
    "\x82\x02\x40\x04\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\xb0\x01\x00\x00\x48" +
    "\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x12\x00\x00\x00\xf8\x01\x00\x00\x00" +
    "\x00\x00\x00\x06\x00\x00\x00\x14\x00\x00\x00\x10\x02\x00\x00\x00\x00\x00\x00\x07" +
    "\x00\x00\x00\x14\x00\x00\x00\x28\x02\x00\x00\x00\x00\x00\x00\x01\x10\x08\x00\xcc" +
    "\xcc\xcc\xcc\xa0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x80\xf1\xe2\x69\xb5" +
    "\x19\xd0\x01\xff\xff\xff\xff\xff\xff\xff\x7f\xff\xff\xff\xff\xff\xff\xff\x7f\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\xff" +
    "\xff\xff\x7f\x08\x00\x08\x00\x04\x00\x02\x00\x00\x00\x00\x00\x08\x00\x02\x00\x00" +
    "\x00\x00\x00\x0c\x00\x02\x00\x00\x00\x00\x00\x10\x00\x02\x00\x00\x00\x00\x00\x14" +
    "\x00\x02\x00\x00\x00\x00\x00\x18\x00\x02\x00\x00\x00\x00\x00\xe8\x03\x00\x00\x01" +
    "\x02\x00\x00\x05\x00\x00\x00\x1c\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x02\x00\x14" +
    "\x00\x14\x00\x24\x00\x02\x00\x28\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10" +
    "\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04" +
    "\x00\x00\x00\x6a\x00\x75\x00\x61\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x01\x02\x00\x00\x07" +
    "\x00\x00\x00\x00\x02\x00\x00\x07\x00\x00\x00\x08\x02\x00\x00\x07\x00\x00\x00\x06" +
    "\x02\x00\x00\x07\x00\x00\x00\x07\x02\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x44" +
    "\x00\x45\x00\x4d\x00\x4f\x00\x2e\x00\x4c\x00\x4f\x00\x43\x00\x41\x00\x4c\x00\x04" +
    "\x00\x00\x00\x01\x04\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\x03\x99\xa8\x68\xe0" +
    "\x0e\x0e\xd9\x9a\x18\xcf\xcf\x80\xf1\xe2\x69\xb5\x19\xd0\x01\x08\x00\x6a\x00\x75" +
    "\x00\x61\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x8b\x24\x4d\x60\xa5" +
    "\x27\x9e\x8f\x5f\x9b\xb6\x2e\xf1\x1e\xf3\xc6\x00\x00\x00\x00\x07\x00\x00\x00\xf3" +
    "\x94\x26\xc3\x09\x48\xd6\xc8\x79\x4a\x37\xed\xef\x09\xaa\xfd\x00\x00\x00\x00"
  end

  describe "#encode" do
    context "when simple Authorization Data" do
      it "encodes Authorization Data correctly" do
        authorization_data.elements = [{:type => pac_type_id, :data => pac_data}]

        expect(authorization_data.encode).to eq(simple)
      end
    end

    context "when nested Authorization Data" do
      it "encodes Authorization Data correctly" do
        nested_auth_data = described_class.new(elements: [{:type => pac_type_id, :data => pac_data}])
        authorization_data.elements = [{:type => ad_if_relevant, :data => nested_auth_data.encode}]

        expect(authorization_data.encode).to eq(nested)
      end
    end
  end

end
