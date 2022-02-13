class ChangePhonenumberToBigint < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :phone, :bigint
    change_column :admins, :phone, :bigint
  end
end
