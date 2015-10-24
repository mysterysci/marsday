class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :email
      t.string :club_name
      t.string :secondary_name
      t.string :secondary_email
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :num_scopes
      t.integer :max_attendees
      t.integer :num_attendees

      t.timestamps null: false
    end
  end
end
