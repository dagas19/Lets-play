class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.integer :spots
      t.text :description
      t.string :experience_level
      t.integer :min_age
      t.integer :max_age
      t.references :game, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
