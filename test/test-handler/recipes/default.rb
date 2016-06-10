my_handler = cookbook_file '/tmp/chef-handler-serverspec.gem' do
  source 'chef-handler-serverspec-0.1.0.gem'
  owner 'root'
  group 'root'
  mode 00644
end

chef_gem 'chef-handler-serverspec' do
  source my_handler.path
  compile_time false
  action :remove
  ignore_failure true
end

chef_gem 'chef-handler-serverspec' do
  source my_handler.path
  compile_time false
  action :install
end

chef_handler 'Chef::Handler::Serverspec' do
  source 'chef/handler/serverspec'
  action :enable
  supports report: true
end
