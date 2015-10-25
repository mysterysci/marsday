class ChangeZipcodeToAddress < ActiveRecord::Migration
  def change
    rename_column :attendees, :zipcode, :address
  end
end
