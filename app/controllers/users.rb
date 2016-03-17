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
  user = User.new(params[:user])
  if user.valid?
    user.save
    update_session user
    @messages[:alerts] = ["Welcome aboard #{user.name}!"]
    @items = current_user_items
    @users = User.all
    erb :index
  else
    @messages[:errors] = user.errors.full_messages
    clear_session
    erb :register, locals: {title: 'User Registration Error'}
  end
end

put '/users/:id' do
  #edit a specific user

end

delete '/users/:id' do
  #delete a specific user

end
