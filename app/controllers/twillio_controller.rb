# go to Downloads(where ngrok is)
# ./ngrok http 9393
# http://cbce6423.ngrok.io -> localhost:9393

post '/inbound' do
  p params
  p '$' * 30

  incoming_number = params["From"]
  body = params["Body"]
  array = body.split(',')

  person = User.find_by(phone_number: incoming_number[2..-1])

  if person != nil

    city = array[0].split.map(&:capitalize).join('_')
    country = array[1].split.map(&:capitalize).join('_')

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