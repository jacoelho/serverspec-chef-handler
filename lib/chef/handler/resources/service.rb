require 'erb'

class Chef
  class Resource
    class Service < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT

  describe service('<%= name %>') do
    it { should be_enabled }
    it { should be_running }
  end
EOT
        ).result(binding)
      end
    end
  end
end
