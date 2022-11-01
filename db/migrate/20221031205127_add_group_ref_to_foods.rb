class AddGroupRefToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :group, null: false, foreign_key: true
  end
end
