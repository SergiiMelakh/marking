class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.references :date_act, index: true
      t.integer :number_act
      t.float :money
      t.references :street, index: true

      t.timestamps null: false
    end
    add_foreign_key :acts, :date_acts
    add_foreign_key :acts, :streets
  end
end
