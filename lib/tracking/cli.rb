
class Tracking::CLI

 attr_accessor :userInput

  def call
    weather_status (get_zipcode)
    goodbye
  end

  def get_zipcode
    userInput = " "
    puts "Enter the Zipcode of the city to find weather: "
    userInput = gets.strip.downcase
    userInput
  end

  def weather_status(userInput)
    puts "Here is the weather data"
    @tracking = Tracking::ZipCode.scrape_weatherStreet(userInput)
    puts " Temperature: #{@tracking[0]}, City: #{@tracking[1]}, Visibility: #{@tracking[2]}, Wind: #{@tracking[3]}"
  end

  def goodbye
    puts "goodbye"
  end
end
