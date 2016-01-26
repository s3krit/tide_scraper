module TideScraper
  class Scraper
    
# Returns tidal prediction
    def get_prediction(port,length=7)
      endpoint = '/ShowPrediction.aspx'
      url = @site+endpoint+"?PortID=#{port}&PredictionLength=#{length}"
      response = @clnt.get(url, follow_redirect: true)
#return nil if response.code != '200'
      doc = Nokogiri::HTML response.content
      tables = doc.xpath('//table[starts-with(@class,"HWLWTable")]')
      tides = []
      tables.each do |table|
        tides.concat(parse_tide_table(table))
      end
      tides.sort_by {|hsh| hsh[:time]}
    end

# Will parse a table from a predictions page on UKHO's EasyTide
# TODO: Timezones
    def parse_tide_table(table)
      year = Time.now.year
      date = table.xpath('tr/th[@class="HWLWTableHeaderCell"]').text
# Populate highs and lows
      hilow = []
      table.xpath('tr[2]/th').each do |hilowth|
        hilow.push hilowth.text
      end
# Populate times
      times = []
      table.xpath('tr[3]/td').each do |timetd|
        times.push Time.parse(timetd.text + " " + year.to_s + " " + date)
      end
      heights = []
      table.xpath('tr[4]/td').each do |heighttd|
        heights.push heighttd.text
      end
      tides = []
      hilow.each_index do |i|
        tide = Hash.new
        tide[:stage] = hilow[i]
        tide[:time] = times[i]
        tide[:height] = heights[i]
        tides.push tide
      end
      return tides
    end
  end
end
