# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "extrComment"
  s.version = "1.0.0.20120825034330"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhao Cai"]
  s.date = "2012-08-25"
  s.description = "extract yaml embeded in source code comments with predefine format.\n\n1. the leading comment string can be different based on the language.\n2. the leading column of yaml docs must be aligned"
  s.email = ["caizhaoff@gmail.com"]
  s.executables = ["extr_comment"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/extr_comment", "lib/extr_comment.rb", "test/test_extr_comment.rb", ".gemtest"]
  s.homepage = "[TODO]( url ) @zhaocai @start(2012-08-24 20:32)"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "extrcomment"
  s.rubygems_version = "1.8.24"
  s.summary = "extract yaml embeded in source code comments with predefine format"
  s.test_files = ["test/test_extr_comment.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 3.3"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<minitest>, ["~> 3.3"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 3.3"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
