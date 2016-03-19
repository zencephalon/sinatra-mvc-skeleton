before do
  @messages ||= {}
  # @locations ||= {}
end

get '/' do
  erb :login
end

get '/login' do
  # if logged_in?
  #   logger.info '/login redirecting to /'
  #   redirect '/'
  # else
    erb :login, locals: {title: 'Login'}
  # end
end

post '/login' do
  if user = User.authenticate(params)
    update_session user
    @locations = current_user_locations
    erb :profile
  else
    @messages[:errors] = ['Login failed. Please verify the email and password you are using.']
    erb :login, locals: {title: 'Login Error'}
  end
end

get '/logout' do
  clear_session
  redirect '/'
end
