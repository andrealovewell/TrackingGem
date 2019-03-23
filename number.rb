class Tracking::ZipCode

  attr_accessor :City, :Visibility, :Wind, :Temperature


   def self.scrape_weatherStreet(userInput)
    tracking =[]
    doc = Nokogiri::HTML(open("http://www.weatherstreet.com/cgi-bin/zipcode.pl.cgi?Name=#{userInput}"))

    weatherUpdate = self.new


    weatherUpdate.Temperature = doc.search("font.currenttemp_font").text
    tracking << weatherUpdate.Temperature

    weatherUpdate.City = doc.search("td:nth-child(2) h1").text
    tracking << weatherUpdate.City

    weatherUpdate.Visibility =doc.search("tr > td:nth-child(1) tr:nth-child(8) td:nth-child(2)").text
    tracking << weatherUpdate.Visibility

    weatherUpdate.Wind =doc.search("tr > td:nth-child(1) tr:nth-child(9) td:nth-child(2)").text
    tracking << weatherUpdate.Wind

    tracking
   end
end
