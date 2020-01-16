require 'bundler/setup'
require 'pry'
require 'fetch_reviews'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = {record: :new_episodes}
  config.allow_http_connections_when_no_cassette = true
end

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
      config.bbb_url = 'https://www.bbb.org/us/or/beaverton/profile/retail-sportswear/nike-inc-1296-6025241/customer-reviews'
    end
  end
end
