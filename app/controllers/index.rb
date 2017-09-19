get '/' do
   @forecast = Forecast.new
  erb :'index'
end
