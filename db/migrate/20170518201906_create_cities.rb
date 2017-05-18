class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :location
      t.datetime :startdate
      t.integer :triporder

      t.timestamps
    end
  end
end
