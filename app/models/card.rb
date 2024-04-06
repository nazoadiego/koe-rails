class Card < ApplicationRecord
  validates :due_date, inclusion: { in: (Date.today..) }

  belongs_to :deck

  def self.due_today
    where('due_date <= ?', Date.today.end_of_day)
  end

  def schedule
    # We should schedule differently depending if it was correct or not
    # Maybe have some sort of interval
    ScheduleCard.new(user).run(self)
  end
end
