require 'spec_helper'

describe Chef::Resource::File::CookbookFile do
  before(:each) do
    @file = Chef::Resource::File::CookbookFile.new('/tmp/file')
    @file.owner('owner')
    @file.group('group')
    @file.mode('0600')
  end

  it 'generates serverspec definitions' do
    expect(@file.to_serverspec).to match(/be_file/)
    expect(@file.to_serverspec).to match(/be_owned_by 'owner'/)
    expect(@file.to_serverspec).to match(/be_grouped_into 'group'/)
    expect(@file.to_serverspec).to match(/be_mode '0600'/)
  end
end
