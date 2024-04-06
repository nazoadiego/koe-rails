class ScheduleCard
  def initialize(user)
    @user = user
  end

  def run(card, correct)
    correct ? mark_as_correct(card) : mark_as_incorrect(card)
  end

  private

  def mark_as_correct(card)
    card.consecutive_successes += 1
    # Increase review_interval more if the note has been consecutively correct
    card.review_interval *= card.consecutive_successes * card.ease_factor

    card
  end

  def mark_as_incorrect(card)
    # Reset if the answer was incorrect
    card.consecutive_successes = 0
    card.review_interval = 1
    # Adjust the ease factor to make interval increases less aggressive after wrong answers
    card.ease_factor = [card.ease_factor - 0.8, 1.3].max

    card
  end
end
