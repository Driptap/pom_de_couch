require 'test_helper'

class ReactionsControllerTest < ActionController::TestCase
  test "should get upload_reaction" do
    get :upload_reaction
    assert_response :success
  end

  test "should get list_reactions" do
    get :list_reactions
    assert_response :success
  end

end
