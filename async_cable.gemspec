$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "async_cable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "async_cable"
  spec.version     = AsyncCable::VERSION
  spec.authors     = ["Kang Zhang"]
  spec.email       = ["piecehealth@sina.com"]
  spec.homepage    = "https://github.com/piecehealth/async_cable"
  spec.summary     = "Use async libary for broadcasting of ActionCable."
  spec.description = "Use async libary for broadcasting of ActionCable."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0.2.1"
  spec.add_dependency "async", ">= 1.24.0"

  spec.add_development_dependency "sqlite3"
end
