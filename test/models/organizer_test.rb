require 'test_helper'

class OrganizerTest < ActiveSupport::TestCase
  test "close organizers" do
    far_org = Organizer.create!(
      name:      "Far Organizer",
      email: 'foo1',
      address: 'foo',
      num_scopes: 1,
      max_attendees: 1,
      location:   'POINT(77 40.000000)'
    )

    close_org = Organizer.create!(
      name:      "Close Organizer",
      email: 'foo2',
      address: 'foo',
      num_scopes: 1,
      max_attendees: 1,
      location:   'POINT(-75.990000 39.010000)'
    )

    close_orgs = Organizer.close_to(39.000000, -76.000000).load

    assert_equal 1,         close_orgs.size
    assert_equal close_org, close_orgs.first
  end

  test "organizers in box" do
    out_org = Organizer.create!(
      name:      "Organizer outside",
      email: 'foo1',
      address: 'foo',
      num_scopes: 1,
      max_attendees: 1,
      location:   'POINT(77 40.000000)'
    )

    in_org = Organizer.create!(
      name:      "Organizer inside",
      email: 'foo2',
      address: 'foo',
      num_scopes: 1,
      max_attendees: 1,
      location:   'POINT(-75.990000 39.010000)'
    )

    box_orgs = Organizer.in_box(39.000000, -76.000000, 39.03, -75.98).load
    assert_equal 1,      box_orgs.size
    assert_equal in_org, box_orgs.first
  end

  test "organizers attendable" do
    attendable_org = Organizer.create!(
      name: "attendable",
      email: 'foo1',
      address: 'foo',
      num_scopes: 1,
      num_attendees: 2,
      max_attendees: 3
    )

    unattendable_org = Organizer.create!(
      name: "unattendable",
      email: 'foo2',
      address: 'foo',
      num_scopes: 1,
      num_attendees: 3,
      max_attendees: 3
    )
    attendable_orgs = Organizer.attendable().load
    assert_equal 1,              attendable_orgs.size
    assert_equal attendable_org, attendable_orgs.first
  end
end
