class ImportCardsToDeck
  def initialize(user)
    @user = user
  end

  def run(deck, cards)
    Card.transaction do
      Card.import! cards, validate: true
    end
  end
end
