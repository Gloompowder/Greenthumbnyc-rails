class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|
      t.string :name
      t.integer :assemblydist
      t.string :borough
      t.integer :communityboard
      t.integer :congressionaldist
      t.integer :coundist
      t.string :juris
      t.string :parksid
      t.string :policeprecinct
      t.string :status
      t.integer :statesenatedist
      t.integer :zipcode
      t.string :openhrssa
      t.string :openhrssu

      t.timestamps
    end
  end
end
