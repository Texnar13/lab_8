require 'test_helper'

class StartPageControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'test get root page' do
    get root_path
    assert_response :success
  end

  test 'test get view page' do
    get result_path
    assert_response :success
  end
end
