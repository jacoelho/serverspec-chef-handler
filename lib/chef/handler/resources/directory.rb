class Chef
  class Resource
    class Directory < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT,

  describe file('#{path}') do
<%- unless action.include? :delete -%>
    it { should be_directory }
    it { should be_mode '#{mode}' }
    it { should be_owned_by '#{owner}' }
    it { should be_grouped_into '#{group}' }
<%- else -%>
    it { should_not be_directory }
<%- end -%>
  end
EOT
          safe_level = nil, trim_mode = '-').result(binding)
      end
    end
  end
end
