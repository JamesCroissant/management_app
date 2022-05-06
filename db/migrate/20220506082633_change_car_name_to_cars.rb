class ChangeCarNameToCars < ActiveRecord::Migration[6.0]
  def change
    change_column :cars, :car_name, :string
  end
end
