Gem::Specification.new do |s|
  s.name         = 'chef-handler-serverspec'
  s.version      = ENV.fetch('VERSION')
  s.summary      = 'Chef report handler'
  s.description  = s.summary
  s.author       = 'Jose Coelho'
  s.email        = 'jose.alberto.coelho@gmail.com'
  s.homepage     = 'http://github.com/jacoelho'
  s.require_path = 'lib'
  s.files        = %w(LICENSE) + Dir.glob('lib/**/*')
  s.license      = 'MIT'
end
