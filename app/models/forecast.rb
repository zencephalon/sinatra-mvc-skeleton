
class Forecast < ActiveRecord::Base
  belongs_to :user


  def response_weather(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/key/conditions/q/#{country}/#{city}.json")

    weather = response['current_observation']['weather']
   end



  def response_temp(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/ENV['WU_API']/conditions/q/#{country}/#{city}.json")

    temp = response['current_observation']['temp_c']

    temp

  end


  def response_wind(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/key/conditions/q/#{country}/#{city}.json")

    temp = response['current_observation']['wind_kph']

    temp

  end






end
