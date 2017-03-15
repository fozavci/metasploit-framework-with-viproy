# -*- coding:binary -*-
require 'spec_helper'

require 'rex/proto/kerberos'
require 'msf/kerberos/client'

describe Msf::Kerberos::Client::AsResponse do
  subject do
    mod = ::Msf::Exploit.new
    mod.extend ::Msf::Kerberos::Client
    mod.send(:initialize)
    mod
  end

  let(:as_response) do
    "\x6b\x82\x02\x52\x30\x82\x02\x4e\xa0\x03\x02\x01\x05\xa1\x03\x02" +
      "\x01\x0b\xa3\x0c\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f\x43\x41\x4c" +
      "\xa4\x11\x30\x0f\xa0\x03\x02\x01\x01\xa1\x08\x30\x06\x1b\x04\x6a" +
      "\x75\x61\x6e\xa5\x82\x01\x10\x61\x82\x01\x0c\x30\x82\x01\x08\xa0" +
      "\x03\x02\x01\x05\xa1\x0c\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f\x43" +
      "\x41\x4c\xa2\x1f\x30\x1d\xa0\x03\x02\x01\x01\xa1\x16\x30\x14\x1b" +
      "\x06\x6b\x72\x62\x74\x67\x74\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f" +
      "\x43\x41\x4c\xa3\x81\xd1\x30\x81\xce\xa0\x03\x02\x01\x17\xa1\x03" +
      "\x02\x01\x02\xa2\x81\xc1\x04\x81\xbe\xa1\xd4\x74\xe2\x82\xe3\x7f" +
      "\xdf\x57\x02\x94\xee\x83\xd7\xcf\x60\xee\xd0\x5d\xad\x4d\x63\x80" +
      "\xf4\xc5\x06\x14\xa4\x01\xbf\x49\x40\x52\x2a\x5b\xcf\xa4\xf7\x3d" +
      "\x71\xd0\xba\xe4\xc0\x4e\xab\xc9\x4b\x2a\x30\x57\x8e\xad\x0c\x15" +
      "\xa4\x19\xb8\xe3\x8a\x86\xd6\xf9\x92\x10\xfe\xc5\x18\xcf\xf5\x06" +
      "\x4b\x3b\x8f\x8e\x29\xcf\x02\x82\x73\xa2\xcb\x41\x64\x07\x59\x7d" +
      "\xf1\xaf\xe5\xa6\xeb\x2f\xa0\x35\x1a\x42\x5d\x4a\xbf\xda\xab\xcb" +
      "\x6d\x10\x58\x12\xa2\xff\x16\x50\xe3\x81\x17\x08\x1d\x9b\x4c\x8b" +
      "\x8b\x2b\xf2\x0c\xfd\x88\xb9\x32\xfb\x34\xb1\xa1\xc4\x56\x48\x99" +
      "\x7d\x5c\x52\x11\x1f\x73\x7e\x48\x15\x2e\xf2\xc8\x74\xb2\x63\x9e" +
      "\x73\x6c\x63\x4c\x68\x83\x02\x77\xc2\xbb\x8d\x6b\x4f\x1d\x96\xa8" +
      "\x05\x10\x47\x85\xe8\xba\x1d\x9c\x88\xd1\x62\xa4\x10\xda\x50\x84" +
      "\x8d\x96\x8d\x28\xad\x51\x60\xa6\x82\x01\x0b\x30\x82\x01\x07\xa0" +
      "\x03\x02\x01\x17\xa1\x03\x02\x01\x01\xa2\x81\xfa\x04\x81\xf7\x2b" +
      "\x3e\xa6\x75\x42\x1d\x77\x6b\xb8\xc0\x70\x0b\x1f\x45\x73\xc2\x7b" +
      "\xcb\xaf\x52\x57\x23\xbe\xea\x6e\x5f\x94\xbc\x47\xe4\x90\xca\x46" +
      "\x88\x13\xb5\x65\x8a\x80\x2b\xef\xbd\x60\x6a\xea\xdc\xa2\x6e\x85" +
      "\x38\xb9\x6a\x2e\x87\x40\x9a\x24\xe9\xb8\xf9\x9b\x60\xf5\x27\x56" +
      "\x5d\xe4\xf2\x86\x80\x26\x20\x17\xa8\x68\x8b\xf5\x15\xce\x82\xc9" +
      "\x86\x5a\x23\xe8\x55\x2d\x24\x4a\xfd\x02\x85\xe6\xb9\x0e\x55\x7e" +
      "\x76\x14\xc6\xbc\xbb\x0f\xb1\x7f\x94\xe7\x3f\x30\xf9\xcc\x49\xba" +
      "\x7e\xe4\xa6\x78\x03\x05\x2e\xd7\x6a\xa7\x29\x69\xf9\x2e\x2e\xd2" +
      "\xb5\x07\x22\x02\x16\xa6\xb1\x81\x32\xe1\x1a\x88\x4d\x96\xa0\xbc" +
      "\x39\x28\x90\x06\x59\x05\xe4\xcd\x7b\x9d\xa5\xe1\x35\x2d\x66\x4f" +
      "\x28\x72\xca\xa8\x0b\xb6\xe7\x3d\xe3\x59\x86\x85\x74\x6a\x0a\xa4" +
      "\x6a\x8e\x68\xb3\x92\x16\x05\x37\x74\xc6\x0b\x8d\x68\xe6\x74\x33" +
      "\x64\x0d\x4a\x3b\x04\x4c\x38\xd5\xaf\x7e\xb6\x9c\x68\xea\x8d\x8f" +
      "\x7a\xc3\xc8\x65\x8b\x24\x0b\xf4\xd3\x69\x52\x4e\x9b\xa0\x09\xc4" +
      "\x3d\x1a\x86\x78\x0e\x31\xef\x5e\x75\xe0\x0b\x27\x78\x5e\xe4\x4b" +
      "\xae\x16\xf5\x29\xee\xaf"
  end

  let(:tgs_response) do
    "\x6d\x82\x04\xad\x30\x82\x04\xa9\xa0\x03\x02\x01\x05\xa1\x03\x02" +
      "\x01\x0d\xa3\x0c\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f\x43\x41\x4c" +
      "\xa4\x11\x30\x0f\xa0\x03\x02\x01\x01\xa1\x08\x30\x06\x1b\x04\x6a" +
      "\x75\x61\x6e\xa5\x82\x03\x85\x61\x82\x03\x81\x30\x82\x03\x7d\xa0" +
      "\x03\x02\x01\x05\xa1\x0c\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f\x43" +
      "\x41\x4c\xa2\x1f\x30\x1d\xa0\x03\x02\x01\x01\xa1\x16\x30\x14\x1b" +
      "\x06\x6b\x72\x62\x74\x67\x74\x1b\x0a\x44\x45\x4d\x4f\x2e\x4c\x4f" +
      "\x43\x41\x4c\xa3\x82\x03\x45\x30\x82\x03\x41\xa0\x03\x02\x01\x17" +
      "\xa1\x03\x02\x01\x02\xa2\x82\x03\x33\x04\x82\x03\x2f\x25\x3d\x74" +
      "\x47\xc7\x96\x38\xb3\xc3\xad\x6c\x0a\x35\x9d\xd3\x56\xf2\x26\x16" +
      "\x69\x7b\x2b\xe3\x70\xe6\x65\xf2\x89\x5d\x8e\x90\x00\x9e\xf7\xc7" +
      "\x54\x66\xab\xdd\xd9\xf8\x1d\x96\xf9\x89\x7f\x3b\x1f\x9f\x28\xa1" +
      "\xec\xee\x05\xd3\x8e\x29\xd6\xcf\xf8\x7b\x4e\x50\x31\x3a\xc0\x7e" +
      "\xcd\xcc\x1c\x65\xe1\x34\xb8\x3c\xa1\xe0\x8d\x0b\x05\xbf\xe0\x42" +
      "\x89\xf0\xcd\x58\x09\x4f\xa8\xb3\xef\x94\x0f\x2d\xa2\xcd\xda\x72" +
      "\xa9\x16\x1a\x9f\x0d\xe3\x9e\xcc\x5a\x3a\xe5\x62\x05\x46\x87\x3b" +
      "\xb9\x4e\xa5\xe8\xbf\x08\x8e\x44\x91\x6f\x83\xfe\x37\x50\xf5\xc5" +
      "\x9c\x2a\x67\x2b\xe7\x76\xa8\x3e\xbf\x40\x43\x5d\xc4\x24\x3d\x59" +
      "\x1c\x62\xdf\x08\x61\x41\x06\xf6\xf0\xd1\xeb\xaa\x30\x23\xd4\xaa" +
      "\xf3\x8c\xd5\x9f\x8b\x48\xcd\xd1\xbe\x35\xe2\x93\x3b\xbc\xd8\xaa" +
      "\x72\xf2\xef\xb7\xa6\xea\x5a\xca\x80\x51\x69\x4e\x9f\x6b\xf3\xaf" +
      "\xd0\x06\x13\x70\xe5\x13\xfc\x3e\xdf\xc3\xb2\xbb\x7c\x40\xfa\xe3" +
      "\x2f\xaf\xe6\xcb\x9d\xf6\xc9\x3a\x33\x2a\xca\x73\x75\x2b\x2a\x4a" +
      "\x15\x06\x93\x3b\x74\xfa\x7d\x61\x88\xbc\x72\x54\xc5\xd3\x2d\xb0" +
      "\xa5\xd9\xa9\xb5\xc5\xf7\x05\xc7\x61\x93\x6b\x4b\x04\x54\x4c\x44" +
      "\x98\x07\x8a\x9b\xda\xcb\x00\xfa\x30\xb1\x35\x91\x37\x54\xf0\xdb" +
      "\x77\x82\x3f\xc4\xb1\xcd\xaa\x76\x4d\x93\x4f\xd4\xe6\x74\x4d\x17" +
      "\x11\xa2\xcd\xdf\x46\xbb\x56\x0f\x3a\x5a\xcd\x95\x1c\xd7\x12\x59" +
      "\x23\x21\x4a\x0e\x09\xe8\xac\xbc\x1a\x10\x09\x3c\x04\x97\x5a\xfd" +
      "\xe6\x2b\xcd\xe3\x9a\x97\x37\x67\x76\x19\xe8\x9c\xe2\x01\xa0\x42" +
      "\x7d\x97\x86\xc5\xb0\x87\xb8\x36\x04\x2a\x8d\x4c\x30\x89\xf4\x4d" +
      "\xc1\x14\xd3\xd4\x8f\xfd\x4e\x28\x9d\x33\x1b\x42\xd0\x58\x0b\x87" +
      "\x2e\x87\xd5\x06\x66\x72\xb2\xa9\x1f\x94\x91\x67\xd4\x63\x89\x53" +
      "\x57\x66\x6a\x88\x59\x42\x8b\x03\x87\xe7\x88\xa0\x8c\x51\xe2\x48" +
      "\xf3\xb7\xe0\xd3\x2e\x58\xd7\xbc\xc7\xe1\x1d\xfa\x4b\xa9\xe7\x7b" +
      "\xab\x0e\x1c\x48\x2f\x98\xf3\xb7\x5c\x44\xa0\xdf\xf0\xa3\xfd\x5f" +
      "\xd4\xd2\xc4\xfc\xe6\xd6\x15\xd4\x73\xb8\x63\x8c\x3b\x42\x30\xb4" +
      "\x21\x51\x61\x40\x97\x0f\xe4\xaf\x52\xd2\x09\xbf\x23\x1d\x0c\xcc" +
      "\xbb\xc2\x4b\x86\xc1\xca\x14\xee\x90\x6c\xa6\x5c\x96\x10\x73\x90" +
      "\x98\x63\xfd\x71\x3a\xaf\x1f\x60\x19\xec\xe4\xba\x6b\xf6\x0d\x89" +
      "\x12\x5d\xd9\xa8\xcb\x1a\x7a\x89\x45\xfb\xa4\xaf\x52\xb5\x0b\x9b" +
      "\xf4\x86\x04\xa3\xb5\xe7\xba\xe0\x19\x4a\xc6\x05\x78\xa7\x6d\xbd" +
      "\x86\xe1\x99\x76\x0b\x11\x31\x16\xa8\x7a\x01\x44\x2d\xbc\x58\xd5" +
      "\xc4\xc1\xd8\x9d\x49\x8a\xa5\xda\x78\x34\x3c\x81\x11\x31\xaa\x85" +
      "\x9f\xf8\xad\x3b\xe0\x29\x48\xf3\x80\x08\x48\x1e\xc3\x53\x02\x06" +
      "\xe2\x2c\x71\x96\xef\xca\x3b\xee\x0a\x64\xf6\x08\xeb\xbd\xc2\xf0" +
      "\xa9\xd4\x2e\x08\xd1\x57\x0d\x0b\xf7\x09\x22\x01\xa2\xb3\xa7\x78" +
      "\xe2\x06\x8e\x2e\xf3\x53\x32\x5b\x45\xb1\x0d\xc6\x61\xb8\x4c\x75" +
      "\x07\x9a\x8b\x58\x53\xca\xb0\x83\x8f\x43\xb7\x24\xed\xff\x51\x81" +
      "\xd0\x33\xa6\x9f\x73\x2b\xc4\x67\xa2\x60\x9c\xc1\xcb\xa1\x60\xf2" +
      "\x88\xc1\xe3\xc7\x9b\x05\x2f\x02\x0d\x2d\x6e\x0b\x31\xe4\x61\x68" +
      "\xa5\x87\x8e\x7c\x8b\xd7\x87\x8a\x3c\xf5\x90\x6e\x97\x5f\xa3\x50" +
      "\x30\xe9\xd2\x30\xb3\x6e\xda\x84\x40\x02\x46\x84\x2c\x09\x19\x72" +
      "\x0b\xa0\xce\x5e\x45\xad\xcd\x3e\x15\x3c\x34\xba\x8d\xc7\xfc\x3f" +
      "\xf3\xf7\x37\xae\x49\xd7\x1d\x9b\x30\x4a\xc1\x1f\x15\x07\xd2\xda" +
      "\xb8\x7b\xe3\x9a\xe7\xb5\xeb\xb2\x8b\xb6\x17\x1a\xab\x31\xce\xec" +
      "\xed\xe6\xab\xd5\x4c\xb6\x57\x88\xb0\x5d\x41\x09\x61\x34\x76\x47" +
      "\x7e\x93\xef\xc6\x01\x1b\x4b\x85\x0e\xe0\x92\xec\xd1\x1f\x13\xba" +
      "\x86\x6e\x67\xa2\xbb\xa1\xdd\x52\x42\x63\x45\x7d\x5f\xd2\xf9\x83" +
      "\x57\x1d\x85\xc4\xba\x39\x7d\xc7\x24\xd7\x2d\xd4\xa6\x81\xf2\x30" +
      "\x81\xef\xa0\x03\x02\x01\x17\xa2\x81\xe7\x04\x81\xe4\xdf\xff\xa1" +
      "\xce\x19\xe6\x14\x06\x47\x01\xc1\xb0\x57\x24\xa8\xce\x7f\xb7\x21" +
      "\xe5\x8e\x47\xa8\x8e\x8c\xca\xd9\x57\x0f\xf1\xf7\x09\x8f\x8c\x55" +
      "\x2d\xad\x62\x2e\xb0\xf5\x2f\xe4\xc4\x5e\xb5\x60\xde\x4f\xa7\x84" +
      "\xbc\x75\x02\xa6\x97\xfa\x68\x67\x1d\xed\xba\x4a\x49\x21\xf9\x93" +
      "\x5b\xd8\x8c\xce\xe2\x0a\x80\xc4\x0d\xc7\xc7\x2c\xdd\x4f\x74\x33" +
      "\xd5\xa7\x40\xf3\x5a\x07\x49\x40\x47\x1c\x30\xef\x82\xfd\x11\x28" +
      "\xa9\x13\xd4\x63\x48\xe3\x5b\xda\x15\xc9\x73\xb2\xc3\x25\xc9\x71" +
      "\x24\x06\x3d\x87\x5e\x46\xbb\xd6\xb1\x99\x18\x4b\x70\xbd\x3c\x0e" +
      "\xda\xba\x7a\x50\x52\x23\x75\x10\x93\x06\xce\xfb\x32\xc2\xbb\x35" +
      "\x48\xc3\xc3\xc2\xd9\x30\xe3\x40\xc6\xc7\x67\x90\x29\xdc\x5d\xcb" +
      "\x92\x58\x45\x04\x07\x0e\xba\xce\x8b\xa0\x7e\x62\x20\xbf\x2d\x5c" +
      "\xbd\xb9\xc8\x61\x25\x77\x80\x60\xd1\xd5\x29\x18\x92\x17\x41\x3a" +
      "\x3f\x42\xcb\xd1\x57\x25\x06\x8b\x2d\x74\x15\x63\x54\x7f\xa9\xb0" +
      "\x73\x2b\x40\x63\x06\x47\xbe\x03\xf6\x37\x97\xe9\x24\x23\xc0\x38" +
      "\x62"
  end

  let(:valid_key) { OpenSSL::Digest.digest('MD4', Rex::Text.to_unicode('juan')) }
  let(:invalid_key) { OpenSSL::Digest.digest('MD4', Rex::Text.to_unicode('invalid')) }
  let(:session_key) { "\x6b\xac\x15\x88\xb5\x36\x47\xfe\x9b\xbb\x07\x7a\xa8\x9d\xac\xe0" }

  describe "#extract_session_key" do
    context "when extracting from an AS response" do
      context "when using a valid key" do
        it "returns the extracted Rex::Proto::Kerberos::Model::EncryptionKey" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          expect(subject.extract_session_key(response, valid_key)).to be_a(Rex::Proto::Kerberos::Model::EncryptionKey)
        end

        it "extracts the correct key" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          key = subject.extract_session_key(response, valid_key)
          expect(key.value).to eq(session_key)
        end
      end

      context "when using an invalid key" do
        it "raises RuntimeError" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          expect { subject.extract_session_key(response, invalid_key) }.to raise_error(RuntimeError)
        end
      end
    end

    context "when extracting from a TGS response" do
      it "raises RuntimeError" do
        response = Rex::Proto::Kerberos::Model::KdcResponse.decode(tgs_response)
        expect { subject.extract_session_key(response, valid_key) }.to raise_error(RuntimeError)
      end
    end
  end

  describe "#extract_logon_time" do
    context "when extracting from an AS response" do
      context "when using a valid key" do
        it "returns the extracted Rex::Proto::Kerberos::CredentialCache::Cache" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          expect(subject.extract_logon_time(response, valid_key)).to be_a(Fixnum)
        end

        it "extracts the correct time" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          time = subject.extract_logon_time(response, valid_key)
          expect(time).to eq(1419128917)
        end
      end

      context "when using an invalid key" do
        it "raises RuntimeError" do
          response = Rex::Proto::Kerberos::Model::KdcResponse.decode(as_response)
          expect { subject.extract_logon_time(response, invalid_key) }.to raise_error(RuntimeError)
        end
      end
    end

    context "when extracting from a TGS response" do
      it "raises RuntimeError" do
        response = Rex::Proto::Kerberos::Model::KdcResponse.decode(tgs_response)
        expect { subject.extract_logon_time(response, valid_key) }.to raise_error(RuntimeError)
      end
    end
  end
end

