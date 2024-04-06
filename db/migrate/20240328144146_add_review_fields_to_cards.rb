class AddReviewFieldsToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :key, :string
    add_column :cards, :string, :string
    add_column :cards, :fret, :integer
    add_column :cards, :review_interval, :integer, default: 1
    add_column :cards, :ease_factor, :float, default: 2.5
    add_column :cards, :consecutive_successes, :integer, default: 0
  end
end
