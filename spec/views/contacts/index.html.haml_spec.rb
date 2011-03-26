require 'spec_helper'

describe "contacts/index.html.haml" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :string => ""
      ),
      stub_model(Contact,
        :string => ""
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
