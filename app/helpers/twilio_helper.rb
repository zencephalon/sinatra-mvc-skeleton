helpers do 


  def cast(country, city) 
    @current_forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")
    @ten_day_forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/forecast10day/q/#{country}/#{city}.json")
    
    array = []
    if @current_forecast['response']['error'] == nil && @current_forecast['current_observation'] != nil && @current_forecast['current_observation']['display_location'] != nil

      array << @current_forecast['current_observation']['weather'] + "\n"
      array << "Temp: "
      array <<  @current_forecast['current_observation']['temp_c'].to_s + " ℃" + "\n"
      array <<  @current_forecast['current_observation']['temp_f'].to_s + " F" + "\n"
      array << "Wind: "
      array << @current_forecast['current_observation']['wind_mph'].to_s + " mph" + "\n"
      array << "Humidity: "
      array << @current_forecast['current_observation']['relative_humidity'].to_s + "\n\n"

      (0..4).each do |number|

        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['date']['weekday'] + " ("
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['date']['month'].to_s + '.'  
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['date']['day'].to_s + '.'
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['date']['year'].to_s + ")" + "\n"

        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['conditions'] + "\n"
        array << "Temp: "
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['high']['celsius'] +"℃" + "\n"
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['high']['fahrenheit'].to_s + "F" + "\n" 
        array << "Wind: " 
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['avewind']['kph'].to_s + "km/h" + "\n"
        array << @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['avewind']['mph'].to_s + "mph" + "\n"
        array << "Humidity: " 
        array <<  @ten_day_forecast['forecast']['simpleforecast']['forecastday'][number]['avehumidity'].to_s + "%" + "\n\n"
      end
    else
      array << "Please type valid city and country or state separated by comma!"
    end
    array.join
  end 
end
