class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :date_job, index: true
      t.references :line, index: true
      t.float      :square, deafult: 0.00
      t.references :street, index: true
      t.string     :house
      t.string     :note

      t.timestamps null: false
    end
    add_foreign_key :jobs, :date_jobs
    add_foreign_key :jobs, :lines
    add_foreign_key :jobs, :streets
  end
end
