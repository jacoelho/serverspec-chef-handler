class Chef
  class Resource
    class Cron < Chef::Resource
      def to_serverspec
        <<-EOT

  describe cron do
    it { should have_entry('#{minute} #{hour} #{day} #{month} #{weekday} #{command}').with_user('#{user}') }
  end
EOT
      end
    end
  end
end
