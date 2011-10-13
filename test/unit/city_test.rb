require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @city = Factory(:city)
  end
  
  test "associations" do
    assert  @city.county.count == 1
  end
end
