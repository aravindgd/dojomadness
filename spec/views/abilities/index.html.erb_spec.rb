require 'rails_helper'

RSpec.describe "abilities/index", type: :view do
  before(:each) do
    assign(:abilities, [
      Ability.create!(
        :name => "Name",
        :description => "MyText",
        :is_ultimate => false,
        :hero => nil
      ),
      Ability.create!(
        :name => "Name",
        :description => "MyText",
        :is_ultimate => false,
        :hero => nil
      )
    ])
  end

  it "renders a list of abilities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
