class RemoveLocationToPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :location
  end
end
