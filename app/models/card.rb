class Card < ApplicationRecord
  validates :due_date, inclusion: { in: (Date.today..) }

  belongs_to :deck

  def self.due_today
    where('due_date <= ?', Date.today.end_of_day)
  end
end
