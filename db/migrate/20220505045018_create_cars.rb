class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer   :car_name,            null: false
      t.string    :car_number,          null: false
      t.string    :car_model,           null: false
      t.references :user,              null: false, foreign_key: true
      t.references :schedule,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
