require 'spec_helper'

describe Chef::Resource::Group do
  before(:each) do
    @group = Chef::Resource::Group.new('something')
    @group.gid(100)
  end

  it 'generates serverspec definitions' do
    expect(@group.to_serverspec).to match(/group\('something'\)/)
    expect(@group.to_serverspec).to match(/should exist/)
  end
end
