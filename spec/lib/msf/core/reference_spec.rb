require 'spec_helper'

describe Msf::Reference do
  it 'is an alias for Msf::Module::Reference' do
    expect(described_class.name).to eq('Msf::Module::Reference')
  end
end