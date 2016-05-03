class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :identity_id
      t.date :register_date
      t.boolean :status
      t.date :closing_date

      t.timestamps null: false
    end
  end
end
