class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :event_id
      t.integer :user_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
