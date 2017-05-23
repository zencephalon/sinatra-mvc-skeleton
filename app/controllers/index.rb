get '/' do
   @forecasts = Forecast.all
  erb :'index'
end
