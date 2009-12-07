require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
end
