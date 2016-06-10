require 'spec_helper'

describe Chef::Resource::Service do
  before(:each) do
    @service = Chef::Resource::Service.new('something')
  end

  it 'generates serverspec definitions' do
    expect(@service.to_serverspec).to match(/should be_enabled/)
  end
end
