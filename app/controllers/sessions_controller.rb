get '/sessions/new' do
  erb :'sessions/new'
end


post '/sessions' do
  @user = User.where(username: params[:username]).first
  if @user && @user.authenticate?(params[:password])
    session[:id] = @user.id
    redirect '/forecasts/new'
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
