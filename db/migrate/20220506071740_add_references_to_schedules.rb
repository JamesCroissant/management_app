class AddReferencesToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :car, null: false, foreign_key: true
  end
end
