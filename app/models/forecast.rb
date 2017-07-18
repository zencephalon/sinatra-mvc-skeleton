
class Forecast < ActiveRecord::Base
  belongs_to :user
  validates :country, :city , presence:true


  def response_weather(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    weather = response['current_observation']['weather']
   end



  def response_temp(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    temp = response['current_observation']['temp_c']

    temp

  end


  def response_wind(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    temp = response['current_observation']['wind_kph']

    temp
  end


    def humidity(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    humidity = response['current_observation']['relative_humidity']

    humidity
  end



  def icon(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    icon = response['current_observation']['icon_url']

    icon
  end


  def fore(country,city)

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")

    result = response['forecast']
    p'@' * 50
    p response
    p'#' * 50
  end



  def local_weather

    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/autoip.json")

    temp = response['current_observation']['icon_url']

    temp

  end


end
