
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
  # @city = (@forecast.city).split.map(&:capitalize).join(' ')
  # @country = (@forecast.country).split.map(&:capitalize).join(' ')
  @weather_json = @forecast.response_weather(country, city)
  @weather10day_jason = @forecast.forecast_10_day(country, city)
  
  if @weather_json['response']['error'] == nil && @weather_json['current_observation'] != nil && @weather_json['current_observation']['display_location'] != nil

    # account_sid = ''
    # auth_token = ''

    # set up a client to talk to the Twilio REST API
    #client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
    #client.account.messages.create({
    #:from => ENV['WU_phone'],
    #:to => 4157564007,
    # :body => "The weather in #{city} is #{@weather}. The temp is #{@temp}, wind: #{@wind}" ,
    #   # :media_url => 'https://climacons.herokuapp.com/clear.png'
    # })

    erb :'forecasts/show'

  else
    @errors = []
    @errors << 'Invalid city, country or state!'
    erb :'/forecasts/new'
  end
end



get '/forecasts/:id/10day' do
  @forecast = Forecast.find(params[:id])
    
  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')
  # @city = (@forecast.city).split.map(&:capitalize).join(' ')
  # @country = (@forecast.country).split.map(&:capitalize).join(' ')

  @weather_json = @forecast.response_weather(country, city)
  @weather10day_jason = @forecast.forecast_10_day(country, city)

  account_sid = ''
  auth_token = ''

  # set up a client to talk to the Twilio REST API
  #client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
  #client.account.messages.create({
  #:from => ENV['WU_phone'],
  #:to => 4157564007,
  #:body => "The weather in #{city} is #{@weather}. The temp is #{@temp}, wind: #{@wind}" ,
  #   # :media_url => 'https://climacons.herokuapp.com/clear.png'
  # })
  erb :'forecasts/show10day'
end



get '/forecasts/:id/hourly/:location' do

  @forecast = Forecast.find(params[:id])
  @location = params[:location]  

  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')

  #@weather_json = @forecast.response_weather(country, city)
  @weather_hourly = @forecast.hourly(country, city)

  # p @weekday = @weather_hourly['hourly_forecast'][0]['FCTTIME']['weekday_name']
  # p @day = @weather_hourly['hourly_forecast'][0]['FCTTIME']['mday']
  # p @month = @weather_hourly['hourly_forecast'][0]['FCTTIME']['mon']
  # p @year = @weather_hourly['hourly_forecast'][0]['FCTTIME']['year']
  # p @hour = @weather_hourly['hourly_forecast'][0]['FCTTIME']['civil']

  # p @icon = @weather_hourly['hourly_forecast'][0]['icon_url']
  # p @condition = @weather_hourly['hourly_forecast'][0]['condition']
  # p @temp_c = @weather_hourly['hourly_forecast'][0]['temp']['metric']
  # p @temp_f = @weather_hourly['hourly_forecast'][0]['temp']['english']
  # p @humidity = @weather_hourly['hourly_forecast'][0]['humidity']
  # p @wind_metric = @weather_hourly['hourly_forecast'][0]['wspd']['metric']
  # p @wind_english = @weather_hourly['hourly_forecast'][0]['wspd']['english']

  erb :'forecasts/hourly'
end


get '/forecasts/:id/hourly10day/:location' do
  @forecast = Forecast.find(params[:id])
  @location = params[:location]
  

  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')
  
  #@weather_json = @forecast.response_weather(country, city)
  @weather_hourly = @forecast.hourly10day(country, city)

  erb :'forecasts/hourly10day'
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

