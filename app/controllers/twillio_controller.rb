# go to Downloads(where ngrok is)
# ./ngrok http 9393
# http://0bc3c31a.ngrok.io -> localhost:9393

post '/inbound' do
 
  incoming_number = params["From"]
  body = params["Body"]
  array = body.split(',')

  person = User.find_by(phone_number: incoming_number[2..-1])

  if person != nil

    city = array[0].split.map(&:capitalize).join('_')
    country = array[1].split.map(&:capitalize).join('_')

    # method is in helpers/twilio_helper
    forecast = cast(country, city)
    
    content_type 'text/xml'

    "<Response>
    <Message>
    Hello #{person.username}!
    The weather in #{array[0]} is:
    #{forecast}
    </Message>
    </Response>"
  end
end