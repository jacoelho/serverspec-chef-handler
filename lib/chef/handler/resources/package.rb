class Chef
  class Resource
    class Package < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT,

  describe package('#{package_name}') do
<%- unless action.include? :remove -%>
    it { should be_installed#{'.with_version(\'' + version + '\')' unless version.nil?} }
<%- else -%>
    it { should_not be_installed }
<%- end -%>
  end
EOT
          safe_level = nil, trim_mode = '-').result(binding)
      end
    end
  end
end
