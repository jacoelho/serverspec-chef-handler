user 'test'

user 'ble' do
  action :remove
end

group 'othertest' do
  members %(test)
end

group 'bla' do
  action :remove
end

file '/tmp/something' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
  content 'test'
end

template '/tmp/config.conf' do
  source 'test.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables(something: 'bla')
end

file '/tmp/delete-me' do
  action :delete
end
