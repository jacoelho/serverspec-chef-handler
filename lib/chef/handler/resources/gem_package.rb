class Chef
  class Resource
    class GemPackage < Chef::Resource::Package
      def to_serverspec
        <<-EOT

  describe package('#{package_name}') do
    it { should be_installed.by('gem')#{'.with_version(\'' + version + '\')' unless version.nil?} }
  end
EOT
      end
    end
  end
end
