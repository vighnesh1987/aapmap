require 'spec_helper'

describe "donations/index" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation,
        :name => "Name",
        :country => "Country",
        :state => "State",
        :district => "District",
        :transaction_id => "Transaction",
        :amount => 1
      ),
      stub_model(Donation,
        :name => "Name",
        :country => "Country",
        :state => "State",
        :district => "District",
        :transaction_id => "Transaction",
        :amount => 1
      )
    ])
  end

  it "renders a list of donations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
