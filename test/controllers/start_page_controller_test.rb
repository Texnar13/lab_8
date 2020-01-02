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

  test "empty get" do
    get result_path
    assert_equal assigns[:bin_m], ' '
    assert_equal assigns[:ans], 0
    assert_equal assigns[:bin_ans], ' '
  end


  test "get with param m = 144" do
    get result_path, params: {mp: 144}
    assert_equal " 10010000", assigns[:bin_m]
    assert_equal 9, assigns[:ans]
    assert_equal " 00001001", assigns[:bin_ans]
  end

end
