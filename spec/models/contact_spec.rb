require 'spec_helper'

describe Contact do
  before(:all) do
    @contact = Factory.build(:contact)
  end

  # it { should have_many(:relationships) }

  it "should handle undirected graphs of relationships" do
    # Contact.
  end
end
