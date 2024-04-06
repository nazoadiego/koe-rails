class GetDeckCards
  def initialize(user)
    @user = user
  end

  def run(deck_id)
    Card.where(deck_id: deck_id)
  end
end