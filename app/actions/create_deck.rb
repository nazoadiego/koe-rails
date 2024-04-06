class CreateDeck
  def initialize(user)
    @user = user
  end

  def run
    Deck.create(user: @user)
  end
end