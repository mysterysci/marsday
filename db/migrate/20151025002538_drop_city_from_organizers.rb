class DropCityFromOrganizers < ActiveRecord::Migration
  def change
    remove_column :organizers, :city
    remove_column :organizers, :state
    remove_column :organizers, :zipcode
  end
end
