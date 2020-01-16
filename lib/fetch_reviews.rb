require "fetch_reviews/version"
require "fetch_reviews/configuration"

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
      FetchReviews::Reviews::Yelp.fetch
    end

    def bbb
      FetchReviews::Reviews::Bbb.fetch
    end

    def thumbtack
      FetchReviews::Reviews::Thumbtack.fetch
    end
  end
end
