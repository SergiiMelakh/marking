class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.string :view
      t.text :describe

      t.timestamps null: false
    end
  end
end
