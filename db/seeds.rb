require 'csv'

file = 'States.csv'
@cards = []

deck = Deck.create(:category => "State Capitals")

CSV.foreach(file, :headers => true) do |row|
  deck.cards << Card.create(:question => row[0], :answer => row[1])
end


deck2 = Deck.create(category: "Old Man Wisdom")

deck2.cards << Card.create(question: "You don't need a cinema when you have a...", answer: "sunset")
deck2.cards << Card.create(question: "woodchips are great because they're wood and you can ___ them too", answer: "eat")
deck2.cards << Card.create(question: "what does cod liver oil cure?", answer: "everything")

deck3 = Deck.create(category: "obscure nonsense")

deck3.cards << Card.create(question: "In 1999 ___ were banned from the NSA for fear they would repeat gov't secrets", answer: "furbies")
deck3.cards << Card.create(question: "What adult beverage gained popularity when it was rumored it was not detectable by breathalyzers", answer: "zima")
deck3.cards << Card.create(question: "____ refers to a neatly manicured front yard with an unmowed mess in the back.", answer: "lawn mullet")


