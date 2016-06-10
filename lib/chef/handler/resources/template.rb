class Chef
  class Resource
    class Template < Chef::Resource::File
      def to_serverspec
        <<-EOT

  describe file('#{path}') do
    it { should be_file }
    it { should be_mode '#{mode}' }
    it { should be_owned_by '#{owner}' }
    it { should be_grouped_into '#{group}' }
    its(:content) do
      should match <<-EOF
#{::File.read(path) if ::File.exist?(path)}
EOF
    end
  end
EOT
      end
    end
  end
end
