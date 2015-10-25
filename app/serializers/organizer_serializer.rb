class OrganizerSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :address

  def latitude
    object.location.latitude
  end

  def longitude
    object.location.longitude
  end
end
