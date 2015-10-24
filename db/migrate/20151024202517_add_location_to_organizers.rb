class AddLocationToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :location, :st_point, geographic: true
  end
end
