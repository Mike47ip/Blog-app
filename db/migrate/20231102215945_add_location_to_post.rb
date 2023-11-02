class AddLocationToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :location, :string
  end
end
