class CreateRefriges < ActiveRecord::Migration[6.0]
  def change
    create_table :refriges do |t|
      t.string :refrige_name,                   null: false
      t.references :user,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
