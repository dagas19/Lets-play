class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.integer :user_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
