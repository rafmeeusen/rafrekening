require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
