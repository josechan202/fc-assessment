class AddCategoryFieldToItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :category, null: true, foreign_key: true
  end
end
