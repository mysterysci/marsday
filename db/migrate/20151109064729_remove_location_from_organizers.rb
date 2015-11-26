class RemoveLocationFromOrganizers < ActiveRecord::Migration
  def change
    remove_column :organizers, :location
  end
end
