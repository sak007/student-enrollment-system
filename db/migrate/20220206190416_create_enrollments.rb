class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :student_id
      t.string :status

      t.timestamps
    end
  end
end
