require 'test_helper'

class PropertyTypeTest < ActiveSupport::TestCase
    test "should have a default scope based on Region Code" do
      Factory(:static_data)
      Factory(:property_type)
      Factory(:property_type, :region_code => "XX")

      assert_equal PropertyType.find_by_code("B").value, "Bicycle"
    end
end
