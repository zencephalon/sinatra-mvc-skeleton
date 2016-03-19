before do
  @messages ||= {}
  # @locations ||= {}
end

get '/locations/:id' do
  if logged_in?
    @locations = Location.all
    erb :map
  else
    redirect '/'
  end
end

get '/locations' do
  if logged_in?
    @locations = (Location.all).to_json
  else
    redirect '/'
  end
end


post '/locations' do
  #create a new location
  if logged_in? #is this secure?
    location = Location.new(params[:location])
    location.user_id = current_user.id
    if location.save
      @locations = current_user_locations
      erb :profile
    else
      #didn't pass validations
      @messages[:errors] = ["That location wasn't formatted properly."]
      @locations = current_user_locations
      erb :profile
    end
  end
end

delete '/locations' do
  if logged_in? #is this secure?
    Location.find(params[:location_id]).destroy
    @locations = current_user_locations
    erb :profile
  else
    redirect '/'
  end
end
