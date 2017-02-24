require 'test_helper'

class VotesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get upvote" do
    get votes_controller_upvote_url
    assert_response :success
  end

  test "should get downvote" do
    get votes_controller_downvote_url
    assert_response :success
  end

end
