class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :game_id
      t.integer :venue_id
      t.date :date
      t.integer :spots
      t.text :description
      t.integer :gender_id
      t.string :experience_level
      t.integer :user_id
      t.integer :min_age
      t.integer :max_age
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
