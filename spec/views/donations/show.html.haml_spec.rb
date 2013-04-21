require 'spec_helper'

describe "donations/show" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
      :name => "Name",
      :country => "Country",
      :state => "State",
      :district => "District",
      :transaction_id => "Transaction",
      :amount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Country/)
    rendered.should match(/State/)
    rendered.should match(/District/)
    rendered.should match(/Transaction/)
    rendered.should match(/1/)
  end
end
