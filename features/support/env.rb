require_relative '../../bookmark'
 
require "Capybara"
require "Capybara/cucumber"
require "rspec"
 
RSpec.configure do |config|
  config.include Capybara::DSL, :type => :feature
end

World do 
  Capybara.app = Bookmark
  # include RSpec::Matchers
end