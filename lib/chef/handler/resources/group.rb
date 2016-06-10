require 'erb'

class Chef
  class Resource
    class Group < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT

  describe group('<%= group_name %>') do
<% unless action.include? :remove %>
    it { should exist }
    it { should have_gid <%= gid %> }
<% else %>
      it { should_not exist }
<% end %>
  end

  <% users.each do |user| %>
  describe user('<%= user %>') do
    it { should belong_to_group '<%= group_name %>' }
  end
  <% end %>
EOT
        ).result(binding)
      end
    end
  end
end
