class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :garden_id
      t.datetime :scheduledin
      t.datetime :scheduledout
      t.datetime :checkin
      t.datetime :checkout
      t.text :review
      t.integer :rating
      t.boolean :visiting
      t.boolean :visited

      t.timestamps
    end
  end
end
