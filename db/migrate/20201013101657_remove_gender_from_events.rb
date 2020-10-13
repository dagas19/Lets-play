class RemoveGenderFromEvents < ActiveRecord::Migration[6.0]
  def change
    change_table :events do |t|
    t.remove :gender_id
  end
  end
end
