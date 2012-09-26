$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "appdrones/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "appdrones"
  s.version     = Appdrones::VERSION
  s.authors     = ["Bert Hajee"]
  s.email       = ["bert.hajee@appdrones.com"]
  s.homepage    = "http://www.appdrones.com"
  s.summary     = "Add's some usefull functionality to rails projects that use Appdrones"
  s.description =  %Q{

      add some rake-tasks

      appdrones:pre-deploy  Do the stuff we need before pushing to cloudfoundry


  }

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "cucumber-rails"
  s.add_dependency "vmc"
end
