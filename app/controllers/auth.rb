get '/' do
  erb :welcome
end


get '/login' do
  erb :'login/login'
end

post '/login' do
  if @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    p @user
    p @user.id
    session[:user_id] = @user.id
    redirect "/dashboard"
  else
    redirect back
  end
end

get '/signup' do
  erb :'login/signup'
end

post '/signup' do
  @user = User.create(username: params[:user][:username], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  if @user.username
    session[:user_id] = @user.id
    redirect '/dashboard'
  else
    redirect back
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end