module FetchReviews
  class Review
    attr_accessor :author_name, :rating, :date, :text, :source

    def initialize(attrs)
      @author_name = attrs[:author_name]
      @rating = attrs[:rating]
      @date = attrs[:date]
      @text = attrs[:text]
      @source = attrs[:source]
    end
  end
end
