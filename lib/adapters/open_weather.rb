module OpenWeather

  class Adapter

    # BASE_URL = "http://api.wunderground.com/api/a820cbdda14d5b20/conditions/q/NY/New_York.json"
    BASE_URL = "http://api.wunderground.com/api/a820cbdda14d5b20/conditions/q/"

    def get_weather(zip)

      zip_code = zip

      response = RestClient.get("#{BASE_URL}#{zip_code}.json")

      data = JSON.parse(response.body)

      puts "The weather is currently #{data["current_observation"]["weather"]}, #{data["current_observation"]["temperature_string"]}, and the relative humidity is #{data["current_observation"]["relative_humidity"]}."

    end

  end

end
