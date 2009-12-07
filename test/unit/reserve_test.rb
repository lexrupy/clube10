require 'test_helper'

class ReserveTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Reserve.new.valid?
  end
end
