class AddColumnDescriptionToRoadtrips < ActiveRecord::Migration[5.0]
  def change
    add_column :roadtrips, :description, :string
  end
end
