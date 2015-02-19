get '/' do
  erb :welcome, :layout => :"home_layout"
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
  @companies = Company.all
  p @companies
  erb :'login/signup'
end

post '/signup' do
  puts "\n\n\n\n\n"
  p params
  
  @user = User.create(username: params[:user][:username], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], company_id: params[:company])
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