before do
  @messages ||= {}
  # @locations ||= {}
end

get '/users' do
  #display all users
  # if you are logged
end

get '/users/new' do
  #display the form for creating a new user
  erb :new_user
end

get '/users/:id' do
  #display a specific user

end

get '/users/:id/edit' do
  #display the form to edit a specific user's profile

end

post '/users' do
  #create a new user
  if params[:password_confirmation] == params[:user]['password']#is this secure?
    user = User.new(params[:user])
    if user.valid?
      user.save
      update_session user
      @messages[:alerts] = ["Welcome aboard #{user.name}!"]
      @locations = current_user_locations
      erb :profile
    else
      @messages[:errors] = user.errors.full_messages
      clear_session
      erb :new_user, locals: {title: 'User Registration Error'}
    end
  else
    @messages[:alerts] = ["Those passwords don't match!"]
    clear_session
    erb :new_user, locals: {title: 'User Registration Error'}
  end
end

put '/users/:id' do
  #edit a specific user

end

delete '/users/:id' do
  #delete a specific user

end
