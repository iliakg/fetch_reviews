
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fetch_reviews/version'

Gem::Specification.new do |spec|
  spec.name          = 'fetch_reviews'
  spec.version       = FetchReviews::VERSION
  spec.authors       = ['ilia']
  spec.email         = ['ilia@spalmalo.com']

  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/iliakg/fetch_reviews'
  spec.license       = 'MIT'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end
