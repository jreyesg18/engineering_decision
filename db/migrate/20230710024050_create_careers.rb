class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string "name_career"
      t.string "job_title"
      t.string "grade_title"
      t.integer "duration"
      t.text "graduate_profile"
      t.text "occupational_field"

      t.timestamps
    end
  end
end
