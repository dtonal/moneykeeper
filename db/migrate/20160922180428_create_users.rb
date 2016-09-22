class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name, limit: 30
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
