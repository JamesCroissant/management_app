class ChangeDatatypeCarNumberOfCars < ActiveRecord::Migration[6.0]
  def change
    change_column :cars, :car_number, :integer
  end
end
