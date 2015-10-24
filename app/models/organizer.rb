class Organizer < ActiveRecord::Base
  has_many :attendees
  validates :name,  presence: true, uniqueness:true
  validates :email,  presence: true, uniqueness:true
  validates :address,  presence: true
  validates :city,  presence: true
  validates :state, presence: true
  validates :zipcode,  presence: true
  validates :num_scopes,  presence: true
  validates :max_attendees,  presence: true
end
