module FetchReviews
  module Scrapers
    class Bbb
      class << self
        def run
          response = HTTParty.get(FetchReviews.configuration.bbb_url)
          scraped_page = Nokogiri::HTML(response.body)
          scraped_page.css('.dtm-review').map do |review|
            FetchReviews::Review.new({
              author_name: review.css('p[class*="Name-"]').text,
              rating: parse_rating(review),
              date: DateTime.strptime(review.css('div[class*="Date-"]').text, '%m/%d/%Y'),
              text: review.css('div[class*="__Review-"]').text,
              source: :bbb
            })
          end
        end

        private

        def parse_rating(el)
          rating_el = el.css('div[class*="Foreground-zvegoo-"]').first
          return if rating_el.nil?

          case rating_el.classes.last
          when 'ingrjX'
            1
          when 'kZqaeh'
            2
          when 'iLLkUx'
            3
          when 'eVSklv'
            4
          when 'kJmHsY'
            5
          else
            0
          end
        end
      end
    end
  end
end
