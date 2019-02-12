class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_hash, null: false
      t.string :salt, null: false
      t.string :img, null: false, default: '/img/user.png'

      t.timestamps
    end
  end
end
