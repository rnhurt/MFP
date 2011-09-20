require 'spec_helper'

describe Alias do
  before(:all) do
    @alias = Factory.build(:alias)
  end

  it "should not allow empty|nil aliases" do
    @alias.name = nil
    @alias.should_not be_valid
  end

  it "should handle small aliases" do
    @alias.name = "A"
    @alias.should be_valid
  end

  it "should handle large aliases" do
    @alias.name = "A big name that probably is bigger than any alias has a right to be"
    @alias.should be_valid
  end
end
