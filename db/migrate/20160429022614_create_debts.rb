class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer :payment_id
      t.date :billed_date
      t.decimal :cost , :precision=>5, :scale=>2 
      t.decimal :taxes, :precision=>5, :scale=>2 
      t.boolean :status

      t.timestamps null: false
    end
  end
end
