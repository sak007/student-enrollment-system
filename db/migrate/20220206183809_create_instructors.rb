class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :user_email
      t.string :password_digest
      t.string :department

      t.timestamps
    end
    add_index :instructors, :user_email, unique: true
  end
end
