
class Forecast < ActiveRecord::Base
  belongs_to :user
  validates :country, :city , presence:true


  def response_weather(country, city)
    response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")
  end

  def forecast_10_day(country, city)
    forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/forecast10day/q/#{country}/#{city}.json")
  end

  def hourly(country, city)
    hourly = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/hourly/q/#{country}/#{city}.json")
  end

  def hourly10day(country, city)
    hourly = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/hourly10day/q/#{country}/#{city}.json")
  end

 def history(country, city, date)
    history = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/history_#{date}/q/#{country}/#{city}.json")
  end

  def radar(country, city)
    radar = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/radar/q/#{country}/#{city}.gif?width=280&height=280&newmaps=1")
  end

  def satellite_radar(country, city)
    satellite = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/animatedradar/animatedsatellite/q/#{country}/#{city}.gif?num=6&delay=50&interval=30")
  end
end
