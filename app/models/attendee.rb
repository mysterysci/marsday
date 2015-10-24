class Attendee < ActiveRecord::Base
  belongs_to :organizer
end
