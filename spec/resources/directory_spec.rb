require 'spec_helper'

describe Chef::Resource::Directory do
  before(:each) do
    @directory = Chef::Resource::Directory.new('/tmp')
    @directory.owner('owner')
    @directory.group('group')
    @directory.mode('0755')
  end

  it 'generates serverspec definitions' do
    expect(@directory.to_serverspec).to match(/be_directory/)
    expect(@directory.to_serverspec).to match(/be_owned_by 'owner'/)
    expect(@directory.to_serverspec).to match(/be_grouped_into 'group'/)
    expect(@directory.to_serverspec).to match(/be_mode '0755'/)
  end
end
