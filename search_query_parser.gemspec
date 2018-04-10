# -*- encoding: utf-8 -*-
# stub: search-query-parser 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "search-query-parser".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Takuma kanari".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-04-10"
  s.description = "Parse search query, such as \"field:value\" format or \"text\" format.".freeze
  s.email = ["chemtrails.t@gmail.com".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "lib/search_query_parser.rb".freeze, "lib/search_query_parser/parser.rb".freeze, "lib/search_query_parser/version.rb".freeze, "search_query_parser.gemspec".freeze]
  s.homepage = "https://github.com/takumakanari/search-query-parser-ruby".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "A Simple parser of query for the searching.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
