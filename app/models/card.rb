class Card < ApplicationRecord
  validates :due_date, inclusion: { in: (Date.current..) }

  belongs_to :deck

  def self.due_today
    where('due_date <= ?', Date.current.end_of_day)
  end
end
