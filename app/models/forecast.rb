class Forecast < ActiveRecord::Base
  belongs_to :user


  def response(city)

    response = HTTParty.get("http://api.wunderground.com/api/putapikey/conditions/q/CA/#{city}.json")


    weather = response['current_observation']['weather']
    temp = response['current_observation']['temp_c']

    p weather
    p "temp is #{temp} C"

  end


end
