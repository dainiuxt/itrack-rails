require "test_helper"

class LatestIssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get latest_issues_index_url
    assert_response :success
  end
end
