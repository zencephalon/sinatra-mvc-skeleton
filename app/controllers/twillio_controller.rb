# go to Downloads(where ngrok is)
# ./ngrok http 9393
# http://cbce6423.ngrok.io -> localhost:9393

post '/inbound' do
  p params
  p '$' * 30

  incoming_number = params["From"]
  p body = params["Body"]
  array = body.split(',')

  city = array[0].split.map(&:capitalize).join('_')
  country = array[1].split.map(&:capitalize).join('_')

  person = User.find_by(phone_number: incoming_number[2..-1])

  response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/conditions/q/#{country}/#{city}.json")
  forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV['WU_API']}/forecast10day/q/#{country}/#{city}.json")

  # def message do
  #   (0..4).each do |number|
  #   forecast['forecast']['simpleforecast']['forecastday'][number]['date']['weekday']
  #   forecast['forecast']['simpleforecast']['forecastday'][number]['date']['month'], forecast['forecast']['simpleforecast']['forecastday'][number]['date']['day'], forecast['forecast']['simpleforecast']['forecastday'][number]['date']['year']
  # end

  content_type 'text/xml'


  "<Response>
  <Message>
  Hello #{person.username}!
  The weather in #{array[0]} is:
  #{response['current_observation']['weather']}
  Temp: #{response['current_observation']['temp_f']} F
  Wind: #{response['current_observation']['wind_mph']} mph
  Humidity: #{response['current_observation']['relative_humidity']}
 

  end
  
  </Message>
  </Response>"
end