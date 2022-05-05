class RemoveScheduleIdFromCar < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :cars, :schedules
    remove_reference :cars, :schedule_id, null: false, foreign_key: true
  end
end
