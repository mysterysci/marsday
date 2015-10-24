class OrganizerSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude

  def latitude
    object.location.latitude
  end

  def longitude
    object.location.longitude
  end
end
