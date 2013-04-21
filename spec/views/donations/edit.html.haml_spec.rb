require 'spec_helper'

describe "donations/edit" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
      :name => "MyString",
      :country => "MyString",
      :state => "MyString",
      :district => "MyString",
      :transaction_id => "MyString",
      :amount => 1
    ))
  end

  it "renders the edit donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", donation_path(@donation), "post" do
      assert_select "input#donation_name[name=?]", "donation[name]"
      assert_select "input#donation_country[name=?]", "donation[country]"
      assert_select "input#donation_state[name=?]", "donation[state]"
      assert_select "input#donation_district[name=?]", "donation[district]"
      assert_select "input#donation_transaction_id[name=?]", "donation[transaction_id]"
      assert_select "input#donation_amount[name=?]", "donation[amount]"
    end
  end
end
