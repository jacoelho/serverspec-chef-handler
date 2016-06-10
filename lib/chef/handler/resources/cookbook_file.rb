class Chef
  class Resource
    class CookbookFile < Chef::Resource::File
      def to_serverspec
        <<-EOT

  describe file('#{path}') do
    it { should be_file }
    it { should be_mode '#{mode}' }
    it { should be_owned_by '#{owner}' }
    it { should be_grouped_into '#{group}' }
  end
EOT
      end
    end
  end
end
