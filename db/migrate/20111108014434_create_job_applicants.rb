class CreateJobApplicants < ActiveRecord::Migration
  def change
    create_table :job_applicants do |t|
      t.references :user
      t.references :position
      t.timestamps
    end
  end
end
