class CreateRefrigeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :refrige_users do |t|
      t.references :refrige, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
