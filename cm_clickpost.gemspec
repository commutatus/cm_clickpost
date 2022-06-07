# frozen_string_literal: true

require_relative "lib/cm_clickpost/version"

Gem::Specification.new do |spec|
  spec.name          = "cm_clickpost"
  spec.version       = CmClickpost::VERSION
  spec.authors       = ["Jishnu De Sarkar", "Aditya Tiwari"]
  spec.email         = ["jishnu@commutatus.com", "taditya.tiwari007@gmail.com"]

  spec.summary       = "Clickpost API integration"
  spec.description   = "Clickpost wrapper"
  spec.license       = "MIT"
  spec.homepage      = 'https://github.com/commutatus/cm_clickpost'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["{lib}/**/*", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
