class GetDeckList
  def initialize(user)
    @user = user
  end

  def run
    Deck.where(user: @user)
  end
end
