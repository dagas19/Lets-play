class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :address
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
