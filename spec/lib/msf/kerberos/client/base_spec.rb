# -*- coding:binary -*-
require 'spec_helper'

require 'rex/proto/kerberos'
require 'msf/kerberos/client'

describe Msf::Kerberos::Client::Base do
  subject do
    mod = ::Msf::Exploit.new
    mod.extend ::Msf::Kerberos::Client
    mod.send(:initialize)
    mod
  end

  let(:client_opts) do
    {
      :name_type => Rex::Proto::Kerberos::Model::NT_PRINCIPAL,
      :client_name => 'test'
    }
  end

  let(:server_opts) do
    {
      :name_type => Rex::Proto::Kerberos::Model::NT_PRINCIPAL,
      :server_name => 'krbtgt/DOMAIN'
    }
  end

  describe "#build_client_name" do
    context "when no opts" do
      it "create a Rex::Proto::Kerberos::Model::PrincipalName" do
        expect(subject.build_client_name).to be_a(Rex::Proto::Kerberos::Model::PrincipalName)
      end

      it "creates a PrincipalName with empty name_String" do
        client_name = subject.build_client_name
        expect(client_name.name_string).to eq([])
      end

      it "creates a NT_PRINCIPAL type PrincipalName" do
        client_name = subject.build_client_name
        expect(client_name.name_type).to eq(Rex::Proto::Kerberos::Model::NT_PRINCIPAL)
      end
    end

    context "when opts" do
      it "create a Rex::Proto::Kerberos::Model::PrincipalName" do
        expect(subject.build_server_name(client_opts)).to be_a(Rex::Proto::Kerberos::Model::PrincipalName)
      end

      it "builds name_string from opts" do
        client_name = subject.build_client_name(client_opts)
        expect(client_name.name_string).to eq(['test'])
      end

      it "builds name_type from opts" do
        client_name = subject.build_client_name(client_opts)
        expect(client_name.name_type).to eq(Rex::Proto::Kerberos::Model::NT_PRINCIPAL)
      end
    end
  end

  describe "#build_server_name" do
    context "when no opts" do
      it "create a Rex::Proto::Kerberos::Model::PrincipalName" do
        expect(subject.build_server_name).to be_a(Rex::Proto::Kerberos::Model::PrincipalName)
      end

      it "creates a PrincipalName with empty name_string" do
        client_name = subject.build_server_name
        expect(client_name.name_string).to eq([])
      end

      it "creates a NT_PRINCIPAL type PrincipalName" do
        client_name = subject.build_server_name
        expect(client_name.name_type).to eq(Rex::Proto::Kerberos::Model::NT_PRINCIPAL)
      end
    end

    context "when opts" do
      it "create a Rex::Proto::Kerberos::Model::PrincipalName" do
        expect(subject.build_server_name(server_opts)).to be_a(Rex::Proto::Kerberos::Model::PrincipalName)
      end

      it "builds the name_string opts" do
        client_name = subject.build_server_name(server_opts)
        expect(client_name.name_string).to eq(['krbtgt', 'DOMAIN'])
      end

      it "builds the name_type from opts" do
        client_name = subject.build_server_name(server_opts)
        expect(client_name.name_type).to eq(Rex::Proto::Kerberos::Model::NT_PRINCIPAL)
      end
    end
  end

end

