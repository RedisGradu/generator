class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :customer_id
      t.integer :citizen_no , :limit => 8
      t.string :full_name
      t.date :birthdate
      t.string :place_of_birth
      t.string :mother_name
      t.string :father_name
      t.integer :district

      t.timestamps null: false
    end
  end
end
