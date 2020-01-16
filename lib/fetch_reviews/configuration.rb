module FetchReviews
  class Configuration
    attr_accessor :yelp_url, :bbb_url, :thumbtack_url

    def initialize
      @yelp_url = nil
      @bbb_url = nil
      @thumbtack_url = nil
    end
  end
end
