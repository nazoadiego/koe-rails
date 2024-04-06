class Card < ApplicationRecord
  validates :due_date, inclusion: { in: (Date.current..) }
  validates :key, presence: true # TODO: to be included in x, or match Letter + Number pattern
  validates :fret, presence: true # TODO: to be a number from x to x
  validates :string, presence: true # TODO: to be included in x

  def self.due_today
    where('due_date <= ?', Date.current.end_of_day)
  end
end
