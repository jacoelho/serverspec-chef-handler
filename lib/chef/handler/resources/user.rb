class Chef
  class Resource
    class User < Chef::Resource
      def to_serverspec
        ERB.new(
          <<-EOT

  describe user('<%= username %>') do
<% unless action.include? :remove %>
    it { should exist }
    <% if uid %>
    it { should have_uid <%= uid %> }
    <% end %>
    <% if shell %>
    it { should have_login_shell '<%= shell %>' }
    <% end %>
    <% if home %>
    it { should have_home_directory '<%= home %>' }
    <% end %>
    <% else %>
      it { should_not exist }
    <% end %>
  end
EOT
        ).result(binding)
      end
    end
  end
end
