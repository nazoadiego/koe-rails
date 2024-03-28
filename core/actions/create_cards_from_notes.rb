class CreateCardsFromNotes
  def initialize(user)
    @user = user
  end
  def run(string, deck)
    # What if the deck doesnt exists?
    string_notes = JSON.parse(string)
    
    string_notes.each do |note|
      card = deck.card.new(name: note.key, fret: note.fret, string: string)
      card.save
    end
  end
end

