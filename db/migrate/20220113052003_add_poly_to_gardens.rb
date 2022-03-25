class AddPolyToGardens < ActiveRecord::Migration[6.1]
  def change
    add_column :gardens, :openhrsm, :string
    add_column :gardens, :openhrsth, :string
    add_column :gardens, :openhrstu, :string
    add_column :gardens, :openhrsw, :string
    add_column :gardens, :openhrsf, :string
    add_column :gardens, :location, :string

  end
end
