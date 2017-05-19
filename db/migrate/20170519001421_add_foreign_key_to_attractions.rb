class AddForeignKeyToAttractions < ActiveRecord::Migration[5.0]
  def change
      add_column :attractions, :city_id, :integer
  end
end
