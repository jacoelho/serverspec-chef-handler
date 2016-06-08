# encoding: utf-8
require 'chef/log'
require 'chef/mash'
require 'chef/handler'

class Chef
  class Handler
    # Serverspec handler
    class Serverspec < Chef::Handler
      attr_reader :config

      def initialize(config = {})
        @config = Mash.new(config)
        @config[:output_dir] ||= '/tmp/serverspec'
        @config
      end

      def report
        build_output_dir
        # cookbooks = run_context.cookbook_collection
        File.open(File.join(config[:output_dir], 'bla.json'), 'w') do |file|
          run_data = data
          file.puts Chef::JSONCompat.to_json_pretty(run_data)
        end
      end

      def build_output_dir
        unless File.exist?(@config[:output_dir])
          FileUtils.mkdir_p(@config[:output_dir])
          File.chmod(00700, @config[:output_dir])
        end
      end
    end
  end
end
