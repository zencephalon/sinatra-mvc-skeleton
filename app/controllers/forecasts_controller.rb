
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
    country = @forecast.country.capitalize
    city = (@forecast.city).split.map(&:capitalize).join('_')

    @icon = @forecast.icon(country, city)
    @weather = @forecast.response_weather(country, city)
    @temp = @forecast.response_temp(country, city)
    @wind = @forecast.response_wind(country, city)
    @humidity = @forecast.humidity(country, city)
    # @local_weather = @forecast.local_weather


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

