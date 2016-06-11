require 'erb'

class Chef
  class Resource
    class Service < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT,

  describe service('<%= name %>') do
<%- if action.include? :enable -%>
    it { should be_enabled }
<%- end -%>
<%- if action.include? :disable -%>
    it { should_not be_enabled }
<%- end -%>
<%- if action.include? :start -%>
    it { should be_running }
<%- end -%>
<%- if action.include? :stop -%>
    it { should_not be_running }
<%- end -%>
  end
EOT
          safe_level = nil, trim_mode = '-').result(binding)
      end
    end
  end
end
