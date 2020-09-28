class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,       null:false
      t.string :area_id,           null:false
      t.string :city,              null:false
      t.string :lot_number,        null:false
      t.string :building
      t.string :tel_number,        null:false
      t.references :shopping,      null:false, foreign_key: true
      t.timestamps
    end
  end
end
