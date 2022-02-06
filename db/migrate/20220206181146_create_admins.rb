class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :user_email
      t.integer :phone
      t.string :password_digest

      t.timestamps
    end
    add_index :admins, :user_email, unique: true
  end
end
