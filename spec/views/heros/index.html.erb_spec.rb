require 'rails_helper'

RSpec.describe "heros/index", type: :view do
  before(:each) do
    assign(:heros, [
      Hero.create!(
        :name => "Name",
        :real_name => "Real Name",
        :health => 2,
        :armour => 3,
        :shield => 4
      ),
      Hero.create!(
        :name => "Name",
        :real_name => "Real Name",
        :health => 2,
        :armour => 3,
        :shield => 4
      )
    ])
  end

  it "renders a list of heros" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Real Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
