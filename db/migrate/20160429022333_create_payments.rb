class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer :debt_id
      t.date :payment_date

      t.timestamps null: false
    end
  end
end
