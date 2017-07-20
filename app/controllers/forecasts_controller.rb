
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

get '/forecasts'  do
  @forecasts = Forecast.all
end


get '/forecasts/new' do
  @forecast = Forecast.new
  erb :'/forecasts/new'
end


post '/forecasts' do
  @forecast = Forecast.new(params[:forecast])
  if @forecast.save
    country = (@forecast.country).split.map(&:capitalize).join('_')
    city = (@forecast.city).split.map(&:capitalize).join('_')
    @city = (@forecast.city).split.map(&:capitalize).join(' ')
    @country = (@forecast.country).split.map(&:capitalize).join(' ')

    weather_json = @forecast.response_weather(country, city)
    weather10day_jason = @forecast.forecast_10_day(country, city)

    @weather = weather_json['current_observation']['weather']
    @icon = weather_json['current_observation']['icon_url']
    @temp = weather_json['current_observation']['temp_c']
    @temp_f = weather_json['current_observation']['temp_f']
    @wind = weather_json['current_observation']['wind_kph']
    @wind_miles = weather_json['current_observation']['wind_mph']
    @humidity = weather_json['current_observation']['relative_humidity']

    @forecast_next_weekday = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['weekday'] 
    @forecast_next_weekday_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['day']   
    @forecast_next_weekday_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['month']   
    @forecast_next_weekday_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['year']   
    @forecast_next_weekday_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['celsius'] 
    @forecast_next_weekday_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
    @forecast_next_weekday_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['celsius']
    @forecast_next_weekday_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']
    @forecast_next_weekday_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['conditions']
    @forecast_next_weekday_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['icon_url']
    @forecast_next_weekday_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['mph']
    @forecast_next_weekday_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['kph']
    @forecast_next_weekday_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avehumidity']


    @forecast2 = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['date']['weekday'] 
    @forecast2_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['date']['day']   
    @forecast2_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['date']['month']   
    @forecast2_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['date']['year']   
    @forecast2_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['high']['celsius'] 
    @forecast2_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['high']['fahrenheit']
    @forecast2_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['low']['celsius']
    @forecast2_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['low']['fahrenheit']
    @forecast2_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['conditions']
    @forecast2_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['icon_url']
    @forecast2_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['avewind']['mph']
    @forecast2_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['avewind']['kph']
    @forecast2_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][2]['avehumidity']


    @forecast3 = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['date']['weekday'] 
    @forecast3_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['date']['day']   
    @forecast3_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['date']['month']   
    @forecast3_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['date']['year']   
    @forecast3_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['high']['celsius'] 
    @forecast3_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['high']['fahrenheit']
    @forecast3_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['low']['celsius']
    @forecast3_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['low']['fahrenheit']
    @forecast3_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['conditions']
    @forecast3_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['icon_url']
    @forecast3_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['avewind']['mph']
    @forecast3_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['avewind']['kph']
    @forecast3_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][3]['avehumidity']


    @forecast4 = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['date']['weekday'] 
    @forecast4_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['date']['day']   
    @forecast4_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['date']['month']   
    @forecast4_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['date']['year']   
    @forecast4_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['high']['celsius'] 
    @forecast4_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['high']['fahrenheit']
    @forecast4_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['low']['celsius']
    @forecast4_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['low']['fahrenheit']
    @forecast4_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['conditions']
    @forecast4_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['icon_url']
    @forecast4_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['avewind']['mph']
    @forecast4_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['avewind']['kph']
    @forecast4_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][4]['avehumidity']









    account_sid = ''
    auth_token = ''

    # set up a client to talk to the Twilio REST API
  #   client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
  #   client.account.messages.create({
  #   :from => ENV['WU_phone'],
  #   :to => 4157564007,
  #   :body => "The weather in #{city} is #{@weather}. The temp is #{@temp}, wind: #{@wind}" ,
  #   # :media_url => 'https://climacons.herokuapp.com/clear.png'
  # })

    erb :"/index"

  else
    @errors = @forecast.errors.full_messages
    erb :'/forecasts/new'
  end
end



# get '/forecasts/:id' do
#   @forecast = Forecast.find(params[:id])
#   # @text_messages = @forecast.text_messages
#   erb :'forecasts/show'
# end


# #Edit
# get '/forecasts/:id/edit' do
#   @forecast = Forecast.find(params[:id])
#   erb :'forecasts/edit'
# end

# put '/forecasts/:id' do
# @forecast = Forecast.find(params[:id])
# @forecast.update_attributes(params[:forecast])
#   if @forecast.save
#     redirect "/"
#   else
#     @errors = @forecast.errors.full_messages
#     erb :'forecasts/edit'
#   end
# end

# #Delete
# delete '/forecast/:id' do
#   @forecast = Forecast.find(params[:id])
#   @forecast.destroy
#   redirect '/'
# end

