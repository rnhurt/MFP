require 'spec_helper'

describe "contacts/new.html.haml" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :string => ""
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_string", :name => "contact[string]"
    end
  end
end
