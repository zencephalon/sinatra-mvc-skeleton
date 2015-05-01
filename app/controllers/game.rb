get '/' do

 erb :index
end

post '/' do
  redirect "/deck_select" if User.find_by(params) != nil
  redirect back
end



get '/deck_select' do
  all_decks = Deck.all
 erb :"/deck/all",  locals: {all_decks: all_decks}
end

get '/:deck_id' do |deck_id|
  card_array = Card.where(deck_id: deck_id)

  erb :card, locals:{card_array: card_array}
end


post '/:deck_id' do

end
