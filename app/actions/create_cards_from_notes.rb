class CreateCardsFromNotes
  def initialize(user)
    @user = user
  end

  def run(notes, deck)
    notes.map do |note|
      {
        name: note[:key],
        key: note[:key],
        fret: note[:fret],
        string: note[:string],
        due_date: Date.current,
        deck_id: deck.id
      }
    end
  end
end
