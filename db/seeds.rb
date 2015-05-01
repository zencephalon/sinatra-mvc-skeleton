sample_deck_info = {
  :name => "Sample Deck 1"
}

sample_deck_2_info = {
  :name => "Sample Deck 2"
}


Deck.create(sample_deck_info)

Deck.create(sample_deck_2_info)


Card.create([
  {question: "New York",  answer: "Albany", deck_id: 1},
  {question: "New Jersey",  answer: "Trenton", deck_id: 1 },
  {question: "Florida",   answer: "Tallahassee", deck_id: 1 },
  {question: "California",  answer: "Sacramento", deck_id: 2 },
  {question: "Nebraska",   answer: "Lincoln", deck_id: 2 },
])

User.create({:name => "Person", :password => '123'})
