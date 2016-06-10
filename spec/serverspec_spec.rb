require 'spec_helper'

describe Chef::Handler::Serverspec do
  before(:each) do
    @handler = Chef::Handler::Serverspec.new(output_dir: '/something')
  end

  describe 'initialize' do
    it 'should allow config hash to have string keys' do
      Chef::Handler::Serverspec.new('output_dir' => 'test')
    end

    it 'should allow config hash to have symbol keys' do
      Chef::Handler::Serverspec.new(output_dir: 'test')
    end
  end
end
