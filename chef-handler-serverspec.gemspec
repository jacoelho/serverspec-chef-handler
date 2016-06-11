Gem::Specification.new do |s|
  s.name         = 'chef-handler-serverspec'
  s.version      = ENV.fetch('VERSION')
  s.summary      = 'Chef report handler serverspec generator'
  s.description  = 'Generate serverspec tests after a chef run'
  s.author       = 'Jose Coelho'
  s.email        = 'jose.alberto.coelho@gmail.com'
  s.homepage     = 'https://github.com/jacoelho/serverspec-chef-handler'
  s.require_path = 'lib'
  s.files        = %w(LICENSE) + Dir.glob('lib/**/*')
  s.license      = 'MIT'
end
