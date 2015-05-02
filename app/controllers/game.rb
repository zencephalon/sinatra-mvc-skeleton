get '/' do
session['user'] ||= nil

 erb :index
end

post '/' do
  if User.authenticate(params[:name], params[:password]) != 'deny'
    session[:user_id] = User.find_by(name: params[:name]).id
    redirect "/deck_select"
  else
    "[LOG] unauthorized log-in attempt..."
    erb :index
  end
  # redirect "/deck_select" if User.find_by(params) != nil
end

get '/logout' do
  session.clear
  redirect "/"
end

get '/deck_select' do
  if current_user
    all_decks = Deck.all
    erb :"/deck/all",  locals: {all_decks: all_decks}
  else
    redirect "/"
  end
end

get '/:card_id' do |card_id|
  if current_user
    card_array = Card.where(deck_id: params[:deck])
    flash_card = card_array.sample
    erb :"/card/card", locals:{card_array: card_array, flash_card: flash_card}
  else
    redirect "/"
  end
end

post '/:card_id' do
  # flash_Card = Card.find_by(:card_id)
  # if flash_card.answer == params[:answer]
  #   redirect "/:card_id"

  # erb :"/card/card", locals:{card_array: card_array}
  # redirect
end

