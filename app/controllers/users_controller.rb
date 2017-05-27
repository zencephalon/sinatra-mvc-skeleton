#index get all users info
get '/users' do
  @users = User.all
  @users.map{|user| user.email.to_s}
  erb :'users/index'
end


#new
get '/users/new' do
   @user = User.new
  erb :'users/new'
end


#create new
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

#user show
get '/users/:id' do
  @user = User.find(params[:id])
    erb :'users/show'
end


#edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

#update
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])
  if @user.valid?
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end

# patch '/users/:id' do
#   update_user
# end


#delete
delete '/users/:id' do
  User.find(params[:id]).destroy!
  session[:id] = nil
  redirect '/users'
end


