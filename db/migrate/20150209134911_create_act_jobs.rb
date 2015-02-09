class CreateActJobs < ActiveRecord::Migration
  def change
    create_table :act_jobs do |t|
      t.references :act, index: true
      t.references :line, index: true
      t.float :square
      t.integer :machine

      t.timestamps null: false
    end
    add_foreign_key :act_jobs, :acts
    add_foreign_key :act_jobs, :lines
  end
end
