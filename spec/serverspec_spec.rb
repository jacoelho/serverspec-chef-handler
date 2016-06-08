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

  it 'creates the directory where the reports will be saved' do
    expect(FileUtils).to receive(:mkdir_p).with('/something')
    expect(File).to receive(:chmod).with(00700, '/something')
    @handler.build_output_dir
  end

  describe 'updated resources' do
    before(:each) do
      @node = Chef::Node.build('chef.handler.datadog.test-resources')
      @node.send(:chef_environment, 'resources')
      @events = Chef::EventDispatch::Dispatcher.new
      @run_context = Chef::RunContext.new(@node, {}, @events)
      @run_status = Chef::RunStatus.new(@node, @events)

      all_resources = [Chef::Resource.new('whiskers'), Chef::Resource.new('paws'), Chef::Resource::Cron.new('cronify')]
      all_resources.first.updated_by_last_action(true)
      @run_context.resource_collection.all_resources.replace(all_resources)

      @run_status.run_context = @run_context
      @run_status.exception = Exception.new('Boy howdy!')
      @file_mock = StringIO.new
      allow(File).to receive(:open).and_yield(@file_mock)
    end

    it 'saves run status data to a file as JSON' do
      expect(@handler).to receive(:build_output_dir)
      @handler.run_report_unsafe(@run_status)
      reported_data = Chef::JSONCompat.parse(@file_mock.string)

      puts reported_data
    end
  end
end
