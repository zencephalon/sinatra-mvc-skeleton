get '/sessions/new' do
  erb :'sessions/new'
end


post '/sessions' do
  @user = User.where(username: params[:username]).first
  if @user && @user.authenticate?(params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = []
    @errors << "Incorrect username or password"
    erb :'sessions/new'
  end
end


delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end
