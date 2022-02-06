class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :password_digest
      t.date :dob
      t.string :user_email
      t.integer :phone
      t.string :major

      t.timestamps
    end
    add_index :students, :user_email, unique: true
  end
end
