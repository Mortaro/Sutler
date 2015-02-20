$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sutler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sutler"
  s.version     = Sutler::VERSION
  s.authors     = ["Christian Mortaro"]
  s.email       = ["christian.mortaro@gmail.com"]
  s.homepage    = "https://github.com/Mortaro/Sutler"
  s.summary     = "Sutler is a CMS engine for Rails generating user interface from YAML"
  s.description = "Sutler does the dirty work to convert simple .yml files in an awsome cms interface"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
