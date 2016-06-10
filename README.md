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
