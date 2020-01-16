module FetchReviews
  class Review
    attr_accessor :author_name, :rating, :text, :source

    def initialize(attrs)
      @author_name = [:author_name]
      @rating = attrs[:rating]
      @text = attrs[:text]
    end
  end
end
