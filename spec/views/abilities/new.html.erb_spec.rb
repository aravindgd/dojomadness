require 'rails_helper'

RSpec.describe "abilities/new", type: :view do
  before(:each) do
    assign(:ability, Ability.new(
      :name => "MyString",
      :description => "MyText",
      :is_ultimate => false,
      :hero => nil
    ))
  end

  it "renders new ability form" do
    render

    assert_select "form[action=?][method=?]", abilities_path, "post" do

      assert_select "input#ability_name[name=?]", "ability[name]"

      assert_select "textarea#ability_description[name=?]", "ability[description]"

      assert_select "input#ability_is_ultimate[name=?]", "ability[is_ultimate]"

      assert_select "input#ability_hero_id[name=?]", "ability[hero_id]"
    end
  end
end
