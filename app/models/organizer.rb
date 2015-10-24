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

  scope :in_box, -> (ne_latitude, ne_longitude, sw_latitude, sw_longitude) {
    where(%{
        ST_MakeEnvelope(%f, %f, %f, %f) &&
        organizers.location
    } % [sw_longitude, sw_latitude, ne_longitude, ne_latitude])
  }
end
