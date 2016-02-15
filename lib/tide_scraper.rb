require 'tide_scraper/version'
require 'tide_scraper/scraper'
require 'nokogiri'
require 'httpclient'
require 'pry'
require 'date'

module TideScraper
  # Return the next prediction for a given list of tides
  # (produced by get_prediction)
  def self.get_next_tide(prediction)
    next_tide = prediction[0]
    prediction.each do |tide|
      if tide[:time] < next_tide[:time]
        next_tide = tide
      end
    end
    return next_tide
  end
end
