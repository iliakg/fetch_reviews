require 'httparty'
require 'nokogiri'

require 'fetch_reviews/version'
require 'fetch_reviews/configuration'
require 'fetch_reviews/review'

require 'fetch_reviews/scrapers/yelp'
require 'fetch_reviews/scrapers/bbb'
require 'fetch_reviews/scrapers/thumbtack'

module FetchReviews
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def all
      yelp + bbb + thumbtack
    end

    def yelp
      FetchReviews::Scrapers::Yelp.run
    end

    def bbb
      FetchReviews::Scrapers::Bbb.run
    end

    def thumbtack
      FetchReviews::Scrapers::Thumbtack.run
    end
  end
end
