module FetchReviews
  class Configuration
    attr_accessor :yelp_url

    def initialize
      @yelp_url = nil
    end
  end
end
