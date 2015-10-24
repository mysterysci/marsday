class Organizer < ActiveRecord::Base
  has_many :attendees
  validates :name,  presence: true, uniqueness:true
  validates :email,  presence: true, uniqueness:true
  validates :address,  presence: true
  validates :num_scopes,  presence: true
  validates :max_attendees,  presence: true

  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_DWithin(
        organizers.location,
        ST_GeographyFromText('POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, distance_in_meters])
  }
end
