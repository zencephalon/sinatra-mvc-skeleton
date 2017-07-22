
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
    redirect "/forecasts/#{@forecast.id}"
  else
    @errors = @forecast.errors.full_messages
    erb :'/forecasts/new'
  end
end



get '/forecasts/:id' do
  @forecast = Forecast.find(params[:id])
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


    @forecast0 = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['weekday'] 
    @forecast0_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['day']   
    @forecast0_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['month']   
    @forecast0_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['year']   
    @forecast0_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['high']['celsius'] 
    @forecast0_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit']
    @forecast0_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['low']['celsius']
    @forecast0_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit']
    @forecast0_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['conditions']
    @forecast0_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['icon_url']
    @forecast0_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avewind']['mph']
    @forecast0_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avewind']['kph']
    @forecast0_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avehumidity']


    @forecast1 = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['weekday'] 
    @forecast1_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['day']   
    @forecast1_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['month']   
    @forecast1_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['year']   
    @forecast1_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['celsius'] 
    @forecast1_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
    @forecast1_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['celsius']
    @forecast1_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']
    @forecast1_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['conditions']
    @forecast1_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['icon_url']
    @forecast1_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['mph']
    @forecast1_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['kph']
    @forecast1_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avehumidity']


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



  erb :'forecasts/show'
end



get '/forecasts/:id/10day' do
  @forecast = Forecast.find(params[:id])
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


    @forecast0 = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['weekday'] 
    @forecast0_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['day']   
    @forecast0_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['month']   
    @forecast0_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['date']['year']   
    @forecast0_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['high']['celsius'] 
    @forecast0_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit']
    @forecast0_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['low']['celsius']
    @forecast0_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit']
    @forecast0_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['conditions']
    @forecast0_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['icon_url']
    @forecast0_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avewind']['mph']
    @forecast0_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avewind']['kph']
    @forecast0_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][0]['avehumidity']


    @forecast1 = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['weekday'] 
    @forecast1_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['day']   
    @forecast1_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['month']   
    @forecast1_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['date']['year']   
    @forecast1_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['celsius'] 
    @forecast1_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
    @forecast1_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['celsius']
    @forecast1_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']
    @forecast1_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['conditions']
    @forecast1_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['icon_url']
    @forecast1_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['mph']
    @forecast1_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avewind']['kph']
    @forecast1_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][1]['avehumidity']


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


    @forecast5 = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['date']['weekday'] 
    @forecast5_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['date']['day']   
    @forecast5_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['date']['month']   
    @forecast5_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['date']['year']   
    @forecast5_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['high']['celsius'] 
    @forecast5_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['high']['fahrenheit']
    @forecast5_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['low']['celsius']
    @forecast5_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['low']['fahrenheit']
    @forecast5_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['conditions']
    @forecast5_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['icon_url']
    @forecast5_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['avewind']['mph']
    @forecast5_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['avewind']['kph']
    @forecast5_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][5]['avehumidity']


    @forecast6 = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['date']['weekday'] 
    @forecast6_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['date']['day']   
    @forecast6_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['date']['month']   
    @forecast6_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['date']['year']   
    @forecast6_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['high']['celsius'] 
    @forecast6_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['high']['fahrenheit']
    @forecast6_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['low']['celsius']
    @forecast6_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['low']['fahrenheit']
    @forecast6_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['conditions']
    @forecast6_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['icon_url']
    @forecast6_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['avewind']['mph']
    @forecast6_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['avewind']['kph']
    @forecast6_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][6]['avehumidity']


    @forecast7 = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['date']['weekday'] 
    @forecast7_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['date']['day']   
    @forecast7_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['date']['month']   
    @forecast7_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['date']['year']   
    @forecast7_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['high']['celsius'] 
    @forecast7_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['high']['fahrenheit']
    @forecast7_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['low']['celsius']
    @forecast7_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['low']['fahrenheit']
    @forecast7_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['conditions']
    @forecast7_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['icon_url']
    @forecast7_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['avewind']['mph']
    @forecast7_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['avewind']['kph']
    @forecast7_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][7]['avehumidity']


    @forecast8 = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['date']['weekday'] 
    @forecast8_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['date']['day']   
    @forecast8_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['date']['month']   
    @forecast8_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['date']['year']   
    @forecast8_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['high']['celsius'] 
    @forecast8_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['high']['fahrenheit']
    @forecast8_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['low']['celsius']
    @forecast8_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['low']['fahrenheit']
    @forecast8_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['conditions']
    @forecast8_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['icon_url']
    @forecast8_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['avewind']['mph']
    @forecast8_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['avewind']['kph']
    @forecast8_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][8]['avehumidity']


    @forecast9 = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['date']['weekday'] 
    @forecast9_day = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['date']['day']   
    @forecast9_month = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['date']['month']   
    @forecast9_year = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['date']['year']   
    @forecast9_temp_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['high']['celsius'] 
    @forecast9_temp_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['high']['fahrenheit']
    @forecast9_temp_low_celsius = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['low']['celsius']
    @forecast9_temp_low_fahrenheit = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['low']['fahrenheit']
    @forecast9_conditions = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['conditions']
    @forecast9_icon = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['icon_url']
    @forecast9_wind_mph = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['avewind']['mph']
    @forecast9_wind_kph = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['avewind']['kph']
    @forecast9_humidity = weather10day_jason['forecast']['simpleforecast']['forecastday'][9]['avehumidity']

   

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



  erb :'forecasts/show10day'
end


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

