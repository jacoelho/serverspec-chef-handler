require 'spec_helper'

describe Chef::Resource::User do
  before(:each) do
    @user = Chef::Resource::User.new('something')
    @user.uid(100)
    @user.gid(100)
    @user.home('/var/something')
    @user.shell('/bin/false')
  end

  it 'generates serverspec definitions' do
    expect(@user.to_serverspec).to match(/user\('something'\)/)
    expect(@user.to_serverspec).to match(/should exist/)
    expect(@user.to_serverspec).to match(/should have_uid 100/)
    expect(@user.to_serverspec).to match(/should have_home_directory \'\/var\/something\'/)
    expect(@user.to_serverspec).to match(/should have_login_shell \'\/bin\/false\'/)
  end
end
