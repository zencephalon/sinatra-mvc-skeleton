
class Forecast < ActiveRecord::Base
  belongs_to :user
  validates :country, :city , presence:true


  def response_weather(country,city)
    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")
  end

  def forecast_10_day(country,city)
    forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/forecast10day/q/#{country}/#{city}.json")
  end


  # def local_weather
  #   response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/autoip.json")
  #   temp = response['current_observation']['icon_url']
  #   temp
  # end

  @d = 'zsfg'
end
