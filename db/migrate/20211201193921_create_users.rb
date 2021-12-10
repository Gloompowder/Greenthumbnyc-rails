class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :picture
      t.string :streetnum
      t.string :apt
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.datetime :birthday
      t.string :gender
      t.string :bio

      t.timestamps
    end
  end
end
