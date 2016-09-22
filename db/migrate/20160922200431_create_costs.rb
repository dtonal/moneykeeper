class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.references :user, foreign_key: true
      t.decimal :price, precision: 6, scale: 2
      t.text :store, limit: 20
      t.text :comment, limit: 200

      t.timestamps
    end
  end
end
