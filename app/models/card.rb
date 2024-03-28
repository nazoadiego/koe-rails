class Card < ApplicationRecord
  belongs_to :deck

  def review_today?
  end

  def schedule
    # We should schedule differently depending if it was correct or not
    # Maybe have some sort of interval
    ScheduleCard.new(user).run(self)
  end
end
