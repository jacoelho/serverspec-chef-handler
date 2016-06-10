class Chef
  class Resource
    class File < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT,

  describe file('#{path}') do
<%- unless action.include? :delete -%>
    it { should be_file }
    it { should be_mode '#{mode}' }
    it { should be_owned_by '#{owner}' }
    it { should be_grouped_into '#{group}' }
    its(:content) do
      should match <<EOF
#{::File.read(path) if ::File.exist?(path)}
EOF
    end
<%- else -%>
    it { should_not be_file }
<%- end -%>
  end
EOT
          safe_level = nil, trim_mode = '-').result(binding)
      end
    end
  end
end
