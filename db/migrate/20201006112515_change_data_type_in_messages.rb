class ChangeDataTypeInMessages < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :date, :datetime
  end
end
