class AddCardsToDeckFromNotes
  def initialize(user)
    @user = user
  end

  def run(deck, notes)
    cards = CreateCardsFromNotes.new(@user).run(deck, notes)
    Card.transaction do
      Card.import! cards, validate: true
    end
  end
end
