require 'spec_helper'

describe Chef::Resource::Link do
  before(:each) do
    @link = Chef::Resource::Link.new('/tmp/file')
    @link.owner('owner')
    @link.group('group')
    @link.to('/etc/file')
    @link.mode('0600')
  end

  it 'generates serverspec definitions' do
    expect(@link.to_serverspec).to match(/be_symlink/)
    expect(@link.to_serverspec).to match(%r{be_linked_to '/etc/file'})
    expect(@link.to_serverspec).to match(/be_owned_by 'owner'/)
    expect(@link.to_serverspec).to match(/be_grouped_into 'group'/)
    expect(@link.to_serverspec).to match(/be_mode '0600'/)
  end
end
