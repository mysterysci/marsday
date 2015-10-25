class Attendee < ActiveRecord::Base
  belongs_to :organizer
  validates :name,  presence: true, uniqueness:true
  validates :email,  presence: true, uniqueness:true
  validates :address, presence: true
  validates :organizer_id, presence: true
end
