
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
  @activeclass1 = true
   
  if @weather_json['response']['error'] == nil && @weather_json['current_observation'] != nil && @weather_json['current_observation']['display_location'] != nil

  @location = @weather_json['current_observation']['display_location']['full']
    # account_sid = ''
    # auth_token = ''

    # set up a client to talk to the Twilio REST API
    # client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
    # client.account.messages.create({
    # :from => ENV['WU_phone'],
    # :to => 4157564007,
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
  @location = @weather_json['current_observation']['display_location']['full']
  @activeclass2 = true

  erb :'forecasts/show10day'
end


get '/forecasts/:id/hourly/:location' do

  @forecast = Forecast.find(params[:id])
  @location = params[:location]  
  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')
  @weather_hourly = @forecast.hourly(country, city)
  @activeclass3 = true
  erb :'forecasts/hourly'
end

get '/forecasts/:id/hourly10day/:location' do
  @forecast = Forecast.find(params[:id])
  @location = params[:location]
  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_') 
  @weather_hourly = @forecast.hourly10day(country, city)
  @activeclass4 = true
  erb :'forecasts/hourly10day'
end

get '/forecasts/:id/history/:location' do
  @forecast = Forecast.find(params[:id])
  @location = params[:location]
  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')
  @activeclass5 = true
  erb :'forecasts/history'
end

post '/history/:id/:location' do
  @forecast = Forecast.find(params[:id])
  @location = params[:location]
  @date = params[:date]
  d = @date.split('/')
  new = []
  new << d[2] << d[0] << d[1]
  formateddate = new.join.to_i

  country = (@forecast.country).split.map(&:capitalize).join('_')
  city = (@forecast.city).split.map(&:capitalize).join('_')
  
  @history = @forecast.history(country, city, formateddate)
  @activeclass5 = true
  
  if @history['history']['dailysummary'] != []
    erb :'forecasts/historydata'
  else
   @errors = []
   @errors << 'No information for selected dates!'
   @errors << 'Try more recent one!'
   erb :'forecasts/history'
  end

end


# get '/forecasts/:id/radar/:location' do
#   @forecast = Forecast.find(params[:id])
#   @location = params[:location]


#   country = (@forecast.country).split.map(&:capitalize).join('_')
#   city = (@forecast.city).split.map(&:capitalize).join('_')

#   p '@'* 40
#   p @satellite_radar = @forecast.satellite_radar(country, city)
#   erb :'forecasts/radar'
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

