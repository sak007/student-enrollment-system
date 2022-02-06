class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :instructor_id
      t.string :weekday1
      t.string :weekday2
      t.string :starttime
      t.string :endtime
      t.string :code
      t.integer :capacity
      t.integer :wlcapacity
      t.string :status
      t.string :room

      t.timestamps
    end
  end
end
