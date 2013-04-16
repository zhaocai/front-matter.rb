
require 'guard/bundler'
require 'guard/rspec'

notification :growl
# notification :terminal_notifier

group :frontend do
  guard 'bundler' do
    watch('Gemfile')
    # Uncomment next line if Gemfile contain `gemspec' command
    # watch(/^.+\.gemspec/)
  end
end

group :backend do

  guard 'rspec', :rvm => ['2.0.0'], :notification  => true  do

    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end

end




