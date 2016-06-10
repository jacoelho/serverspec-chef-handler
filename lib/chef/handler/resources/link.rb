class Chef
  class Resource
    class Link < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT

  describe file('#{target_file}') do
    <% unless action.include? :delete %>
    it { should be_symlink }
    it { should be_linked_to '#{to}' }
    it { should be_mode '#{mode}' }
    it { should be_owned_by '#{owner}' }
    it { should be_grouped_into '#{group}' }
    <% else %>
      it { should_not be_symlink }
    <% end %>
  end
EOT
        ).result(binding)
      end
    end
  end
end
