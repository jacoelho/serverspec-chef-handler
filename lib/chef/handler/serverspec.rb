# encoding: utf-8
require 'chef/log'
require 'chef/mash'
require 'chef/handler'

Dir[File.dirname(__FILE__) + '/resources/*.rb'].each { |file| require file }

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
        resource_tree.each do |cookbook, recipes|
          recipes.each do |recipe, resources|
            spec_dir = File.join(@config[:output_dir], cookbook)
            build_output_dir(spec_dir)

            File.open(File.join(spec_dir, "#{recipe}_spec.rb"), 'w') do |file|
              file.write("context 'recipe[#{cookbook}::#{recipe}]' do\n")
              resources.each do |r|
                file.write(r.to_serverspec)
              end
              file.write("end\n")
            end
          end
        end
      end

      def build_output_dir(name)
        unless File.exist?(name)
          FileUtils.mkdir_p(name)
          File.chmod(00700, name)
        end
      end

      def resource_tree
        resources = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = [] } }

        all_resources.each do |r|
          resources[r.cookbook_name || 'none'][r.recipe_name || 'none'] << r
        end

        resources
      end
    end
  end
end
