class Chef
  class Resource
    def to_serverspec
      <<-EOT

  # not implemented #{resource_name}[#{name}]"
EOT
    end
  end
end
