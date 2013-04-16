# -*- ruby -*-

require 'rubygems' unless defined? Gem
require 'hoe'

Hoe.plugin :bundler
Hoe.plugin :gemspec
Hoe.plugin :git
Hoe.plugin :version
Hoe.plugin :travis
Hoe.plugin :yard

Hoe.spec 'front-matter' do

  developer('Zhao Cai', 'caizhaoff@gmail.com')

  license 'GPL-3'

  extra_deps << ['facets', '>= 2.9.0']



  extra_dev_deps << ['rspec', '>= 2.13']
  extra_dev_deps << ['rake', '>= 10.0.0']
  extra_dev_deps << ['hoe'] << ['hoe-gemspec'] << ['hoe-git'] << ['hoe-version'] << ['hoe-bundler'] << ['hoe-yard']
  extra_dev_deps << ['awesome_print', '>= 1.1.0']
  extra_dev_deps << ['guard', '~> 1.7.0'] << ['guard-rspec'] << ['guard-bundler']
  extra_dev_deps << ['terminal-notifier-guard'] << ['growl'] 

end

%w{major minor patch}.each { |v| 
  desc "Bump #{v.capitalize} Version"
  task "bump:#{v}", [:message] => ["version:bump:#{v}"] do |t, args|
    m = args[:message] ? args[:message] : "Bump version to #{ENV["VERSION"]}"
    sh "git commit -am '#{m}'"
  end
}

desc "changelog"
task :changelog => [] do
  sh "vclog -f markdown -r > History.md"
end
# vim: syntax=ruby
