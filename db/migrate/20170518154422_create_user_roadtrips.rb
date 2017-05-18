class CreateUserRoadtrips < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roadtrips do |t|
      t.references :user, foreign_key: true
      t.references :roadtrip, foreign_key: true

      t.timestamps
    end
  end
end
