require_relative './predictions.rb'
require_relative './ports.rb'

module TideScraper
  class Scraper
    def initialize
      @site = 'http://www.ukho.gov.uk/easytide/EasyTide'
      @clnt = HTTPClient.new
      return true
    end
  end
end
