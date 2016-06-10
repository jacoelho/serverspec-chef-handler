require 'spec_helper'

describe Chef::Resource::Cron do
  before(:each) do
    @cron = Chef::Resource::Cron.new('something')
    @cron.user('something')
    @cron.hour('5')
    @cron.minute('0')
    @cron.command('/bin/true')
  end

  it 'generates serverspec definitions' do
    expect(@cron.to_serverspec).to match(/0 5 * * */)
    expect(@cron.to_serverspec).to match(%r{/bin/true})
    expect(@cron.to_serverspec).to match(/with_user\('something'\)/)
  end
end
