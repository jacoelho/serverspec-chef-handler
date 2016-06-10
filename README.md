# chef-handler-serverspec

Sometimes you inherit a chef infrastructure without any test.

How to improve with less amount of effort?

Just add this handler, run chef-client and collect the tests

# Configuration

## client.rb

```ruby
require 'chef/handler/serverspec'
report_handlers << Chef::Handler::Serverspec.new
```

## chef_handler cookbook

```ruby
chef_gem 'chef-handler-serverspec' do
  compile_time false
  action :install
end

chef_handler 'Chef::Handler::Serverspec' do
  source 'chef/handler/serverspec'
  action :enable
  supports report: true
end
```
