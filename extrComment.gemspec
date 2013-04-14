# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ExtrComment"
  s.version = "1.0.1.20130414122332"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhao Cai"]
  s.date = "2013-04-14"
  s.description = "extract embeded info (yaml, for example ) in source code comments with\npredefined format.\n\n1. the leading comment string can be different based on the language.\n2. the leading column of yaml docs must be aligned"
  s.email = ["caizhaoff@gmail.com"]
  s.executables = ["extr_comment"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/extr_comment", "lib/extr_comment.rb", "test/test_extr_comment.rb", ".gemtest"]
  s.homepage = "https://github.com/zhaocai/extrComment"
  s.licenses = ["GPL-3"]
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "extrcomment"
  s.rubygems_version = "2.0.3"
  s.summary = "extract embeded info (yaml, for example ) in source code comments with predefined format"
  s.test_files = ["test/test_extr_comment.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.13"])
      s.add_development_dependency(%q<rake>, [">= 10.0.0"])
      s.add_development_dependency(%q<hoe>, [">= 0"])
      s.add_development_dependency(%q<hoe-gemspec>, [">= 0"])
      s.add_development_dependency(%q<hoe-git>, [">= 0"])
      s.add_development_dependency(%q<hoe-version>, [">= 0"])
      s.add_development_dependency(%q<hoe-bundler>, [">= 0"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rspec>, [">= 2.13"])
      s.add_dependency(%q<rake>, [">= 10.0.0"])
      s.add_dependency(%q<hoe>, [">= 0"])
      s.add_dependency(%q<hoe-gemspec>, [">= 0"])
      s.add_dependency(%q<hoe-git>, [">= 0"])
      s.add_dependency(%q<hoe-version>, [">= 0"])
      s.add_dependency(%q<hoe-bundler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rspec>, [">= 2.13"])
    s.add_dependency(%q<rake>, [">= 10.0.0"])
    s.add_dependency(%q<hoe>, [">= 0"])
    s.add_dependency(%q<hoe-gemspec>, [">= 0"])
    s.add_dependency(%q<hoe-git>, [">= 0"])
    s.add_dependency(%q<hoe-version>, [">= 0"])
    s.add_dependency(%q<hoe-bundler>, [">= 0"])
  end
end
