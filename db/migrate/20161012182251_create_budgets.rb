class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.decimal :value, precision: 6, scale: 2

      t.timestamps
    end
  end
end
