get '/forecasts'  do
  @forecasts = Forecasts.all
end


get '/forecasts/new' do
  erb '/forecasts/new'
end


post '/forecasts' do
  @forecast = Forecasts.new(params[:forecast])
  if @forecast.save
    redirect "forecasts"
  else
    @errors = @forecast.full_messages
    erb '/forecasts/new'
  end
end



get '/forecasts/:id' do
  @forecast = Forecast.find(params[:id])
  # @text_messages = @forecast.text_messages
  erb :'forecasts/show'
end


#Edit
get '/forecasts/:id/edit' do
  @forecast = Forecast.find(params[:id])
  erb :'restaurants/edit'
end

put '/forecasts/:id' do
@forecast = Forecast.find(params[:id])
@forecast.update_attributes(params[:forecast])
  if @forecast.save
    redirect "/"
  else
    @errors = @restaurant.errors.full_messages
    erb :'forecasts/edit'
  end
end

#Delete
delete '/forecast/:id' do
  @forecast = Forecast.find(params[:id])
  @forecast.destroy
  redirect '/'
end

