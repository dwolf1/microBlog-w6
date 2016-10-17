class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.text :bio
      t.string :password
      t.datetime :dob
      t.datetime :lastOn
      t.boolean :admin
      t.string :picture
    end
  end
end
