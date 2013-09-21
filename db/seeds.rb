require 'csv'

file = 'States.csv'
@cards = []

deck = Deck.create(:category => "State Capitals")

CSV.foreach(file, :headers => true) do |row|
  deck.cards << Card.create(:question => row[0], :answer => row[1])
end
