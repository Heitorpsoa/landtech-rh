class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :skills, array:true
      t.string :status, default: "ACTIVE"
      t.belongs_to :recruiter
      t.timestamps
    end
  end
end
