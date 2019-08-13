require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Rambutan Stationery MS"
    assert_equal full_title("Help"), "Help | Rambutan Stationery MS"
  end
end