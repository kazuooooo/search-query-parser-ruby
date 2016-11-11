# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_query_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "search-query-parser"
  spec.version       = SearchQueryParser::VERSION
  spec.authors       = ["Takuma kanari"]
  spec.email         = ["chemtrails.t@gmail.com"]

  spec.summary       = %q{A Simple parser of query for the searching.}
  spec.description   = %q{Parse search query, such as "field:value" format or "text" format.}
  spec.homepage      = "https://github.com/takumakanari/search-query-parser-ruby"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
