require 'spec_helper'

describe "donations/new" do
  before(:each) do
    assign(:donation, stub_model(Donation,
      :name => "MyString",
      :country => "MyString",
      :state => "MyString",
      :district => "MyString",
      :transaction_id => "MyString",
      :amount => 1
    ).as_new_record)
  end

  it "renders new donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", donations_path, "post" do
      assert_select "input#donation_name[name=?]", "donation[name]"
      assert_select "input#donation_country[name=?]", "donation[country]"
      assert_select "input#donation_state[name=?]", "donation[state]"
      assert_select "input#donation_district[name=?]", "donation[district]"
      assert_select "input#donation_transaction_id[name=?]", "donation[transaction_id]"
      assert_select "input#donation_amount[name=?]", "donation[amount]"
    end
  end
end
