class CreateDateActs < ActiveRecord::Migration
  def change
    create_table :date_acts do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
