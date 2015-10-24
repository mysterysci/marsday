class Organizer < ActiveRecord::Base
  has_many :attendees

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
