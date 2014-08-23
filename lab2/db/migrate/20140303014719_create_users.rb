class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :verified
      t.string :password_hash
      t.string :password_salt
      t.string :confirmation_code
      t.string :cancelation_code

      t.timestamps
    end
  end
end
