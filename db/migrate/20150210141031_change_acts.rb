class ChangeActs < ActiveRecord::Migration
  def change
  	change_table :acts do |t|
      t.change :money, :float, default: 0.00
    end
  end
end
