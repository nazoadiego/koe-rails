class DecksController < ApplicationController
  before_action :set_deck, only: %i[show update destroy]

  # GET /decks
  def index
    @decks = Deck.all

    render json: @decks
  end

  # GET /decks/1
  def show
    render json: { deck: @deck }
  end

  # GET /decks/1/review
  def review
    deck = Deck.includes(:cards).find(review_deck_params[:deck_id])

    # TODO: sort by date, older due dates first
    render json: { deck: deck, cards: deck.cards.due_today }
  end

  # TODO: Reset deck

  # POST /decks
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      render json: @deck, status: :created, location: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decks/1
  def update
    if @deck.update(deck_params)
      render json: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    @deck.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  def review_deck_params
    params.permit(:deck_id)
  end

  # Only allow a list of trusted parameters through.
  def deck_params
    params.require(:deck).permit(:name, :user_id)
  end
end
