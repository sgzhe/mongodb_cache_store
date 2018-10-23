
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mongodb_cache_store/version"

Gem::Specification.new do |spec|
  spec.name          = "mongodb_cache_store"
  spec.version       = MongodbCacheStore::VERSION
  spec.authors       = ["sgzhe"]
  spec.email         = ["6485785@qq.com"]

  spec.summary       = %q{ActiveSupport cache using MongoDB for Rails.}
  spec.description   = %q{MongoDBCacheStore provider for the standard Rails cache mechanism. Mongo is well-suited to caching.}
  spec.homepage      = "https://github.com/sgzhe/mongodb_cache_store"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activesupport", "~> 5.1"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "mongo", "~> 2.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "mongoid", "~> 6.2"


end
