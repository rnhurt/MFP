require 'test_helper'

class CodeTest < ActiveSupport::TestCase
    test "should have exactly 1 active entry" do
      code = Factory(:code, :active => true)
      assert_equal Code.all.count, Code.active.count 
      refute_equal Code.all.count, Code.inactive.count 
    end

    test "should have exactly 1 inactive entry" do
      code = Factory(:code, :active => false)
      assert_equal Code.all.count, Code.inactive.count 
      refute_equal Code.all.count, Code.active.count 
    end
end
