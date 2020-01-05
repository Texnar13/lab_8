require 'test_helper'

class StartPageControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'test get root page' do
    get root_path, params: {pm: 4, format: 'xml'}
    assert_response :success

    assert_equal('xml', assigns[:format])
  end

end
