class CreateCardsFromNotes
  def initialize(user)
    @user = user
  end
  def run(notes, deck)
    notes.each do |note|
      deck.cards.create!(name: note[:key], key: note[:key], fret: note[:fret], string: note[:string])
    end
  end
end

