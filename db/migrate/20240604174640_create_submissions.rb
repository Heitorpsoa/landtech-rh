class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :mobile_phone
      t.string :resume
      t.belongs_to :job
      t.timestamps
    end
  end
end
