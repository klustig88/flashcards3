require 'csv'

file = 'States.csv'
@cards = []

deck = Deck.create(:category => "State Capitals")

CSV.foreach(file, :headers => true) do |row|
  deck.cards << Card.create(:question => row[0], :answer => row[1])
end


deck2 = Deck.create(category: "Old Man Wisdom")

deck2 << Card.create(question: "You don't need a cinema when you have a...", answer: "sunset")
deck2 << Card.create(question: "woodchips are great because they're wood and you can ___ them too", answer: "eat")
deck2 << Card.create(question: "what does cod liver oil cure?", answer: "everything")

