# frozen_string_literal: true
require_relative '../rails_helper'

# Capybara.javascript_driver = :webkit
# Capybara.javascript_driver = :poltergeist
Capybara.javascript_driver = :selenium

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:each) do
    # DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
