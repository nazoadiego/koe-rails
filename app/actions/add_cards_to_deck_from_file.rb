class AddCardsToDeckFromFile
  def initialize(user)
    @user = user
  end

  def run(deck, file_path)
    notes = ParseStringData.new.run(file_path)
    cards = CreateCardsFromNotes.new(@user).run(notes, deck)
    Card.transaction do
      Card.import! cards, validate: true
    end
  end
end
