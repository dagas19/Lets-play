class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :preferred_games, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_reference :users, :gender, null: false, foreign_key: true
  end
end
