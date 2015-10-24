require 'test_helper'

class OrganizerTest < ActiveSupport::TestCase
  test "close organizers" do
    far_org = Organizer.create!(
      name:      "Far Organizer",
      location:   'POINT(77 40.000000)'
    )

    close_org = Organizer.create!(
      name:      "Close Organizer",
      location:   'POINT(-75.990000 39.010000)'
    )

    close_orgs = Organizer.close_to(39.000000, -76.000000).load

    assert_equal 1,         close_orgs.size
    assert_equal close_org, close_orgs.first
  end
end
