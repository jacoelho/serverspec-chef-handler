require 'spec_helper'

describe Chef::Resource::Package do
  before(:each) do
    @package = Chef::Resource::Package.new('httpd')
  end

  it 'generates serverspec definitions' do
    expect(@package.to_serverspec).to match(/package\(\'httpd\'\)/)
    expect(@package.to_serverspec).to match(/be_installed/)
  end

  it 'generates serverspec definitions with version' do
    @package.version('v1.0.0')
    expect(@package.to_serverspec).to match(/with_version\(\'v1.0.0\'\)/)
  end
end
