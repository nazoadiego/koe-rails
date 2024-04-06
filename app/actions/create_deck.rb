class CreateDeck
  def initialize(user)
    @user = user
  end

  def run(name:)
    Deck.create(user: @user, name: name)
  end
end
