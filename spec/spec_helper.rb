require 'bundler/setup'
require 'pry'
require 'fetch_reviews'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    FetchReviews.configure do |config|
      config.yelp_url = 'http://yelp_url.com'
    end
  end
end
