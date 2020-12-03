class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :food_name,               null: false
      t.string :product_name
      t.integer :category_id,            null: false
      t.date :purchase_date,             null: false
      t.date :sell_by
      t.string :shop
      t.references :refrige,       foreign_key: true
      t.timestamps
    end
  end
end
