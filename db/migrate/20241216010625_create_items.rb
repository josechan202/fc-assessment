class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :weight
      t.string :brand
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
