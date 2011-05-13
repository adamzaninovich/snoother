# using bundler simply to keep track of the dependencies
# you MUST explicitly require any gems in the files they are needed

source "http://rubygems.org"

# Specify your gem's dependencies in snoother.gemspec
# gemspec

# the following should eventually be moved into the gemspec file
group :test do
  # minitest is included in ruby 1.9, but the gem pulls in the latest changes
  gem 'minitest',   '~> 2',   :require => false
  # gem 'mocha',      '~> 0.9', :require => false
end
