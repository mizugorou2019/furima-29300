class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,            null: false
      t.text    :description,      null: false
      t.integer :price,           null: false
      t.integer :category,        null: false
      t.integer :condition,       null: false
      t.integer :postage_payer,   null: false
      t.integer :shipping_origin, null: false
      t.integer :preparation_day, null: false
      t.integer :user_id,         null: false,  foreign_key: true

      t.timestamps
    end
  end
end
