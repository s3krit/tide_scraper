module TideScraper
  class Scraper
    def get_port_info(port_id)
      endpoint = '/SelectPrediction.aspx?PortID='
      url = @site+endpoint+port_id.to_s
      response = @clnt.get(url)
      return nil unless response.code == 200
      doc = Nokogiri::HTML response.content
      error = doc.xpath('//h1[contains(.,"An error has occurred")]').size
      return nil if error > 0
      port_info = Hash.new
      port_info[:id] = port_id.to_s
      port_info[:name] = doc.xpath('//span[@class="PortName"]').text
      port_info[:country] = doc.xpath('//span[@class="CountryPredSummary"]').text
      return port_info
    end
  end
end
