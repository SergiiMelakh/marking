class ChangeJobs < ActiveRecord::Migration
  def change
  	change_table :jobs do |t|
      t.change :square, :float, default: 0.00
    end
  end
end
