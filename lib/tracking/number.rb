class Tracking::Number

  attr_accessor :City, :Visibility, :Wind, :destination, :Temperature


   def self.scrape_seventeenTrack(userInput)
    tracking =[]
    doc = Nokogiri::HTML(open("http://www.weatherstreet.com/cgi-bin/zipcode.pl.cgi?Name=#{userInput}"))

    shipmentUpdate = self.new


    shipmentUpdate.Temperature = doc.search("font.currenttemp_font").text
    tracking << shipmentUpdate.Temperature

    shipmentUpdate.City = doc.search("td:nth-child(2) h1").text
    tracking << shipmentUpdate.City

    shipmentUpdate.Visibility =doc.search("tr > td:nth-child(1) tr:nth-child(8) td:nth-child(2)").inner_html
    tracking << shipmentUpdate.Visibility

    shipmentUpdate.Wind =doc.search("tr > td:nth-child(1) tr:nth-child(9) td:nth-child(2)").inner_html
    tracking << shipmentUpdate.Wind

    tracking
  end
end
