class CreateDateJobs < ActiveRecord::Migration
  def change
    create_table :date_jobs do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
