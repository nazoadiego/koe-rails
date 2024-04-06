class AddDueDateToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :due_date, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
