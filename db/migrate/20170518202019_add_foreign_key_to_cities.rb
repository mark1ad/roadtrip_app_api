class AddForeignKeyToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :roadtrip_id, :integer
  end
end
