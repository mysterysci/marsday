require 'test_helper'

class OrganizersControllerTest < ActionController::TestCase
  test "should get index" do
    attendable_org = Organizer.create!(
      name: "attendable",
      email: 'foo1',
      address: 'foo',
      num_scopes: 1,
      num_attendees: 2,
      max_attendees: 3,
      location: 'POINT(78 34)'
    )
    get :index
    assert_response :success
  end

end
