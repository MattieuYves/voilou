class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :brand
      t.string :model
      t.string :year_of_production
      t.string :address
      t.float :price_per_day

      t.timestamps
    end
  end
end
