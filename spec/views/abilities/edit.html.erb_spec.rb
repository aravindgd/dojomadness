require 'rails_helper'

RSpec.describe "abilities/edit", type: :view do
  before(:each) do
    @ability = assign(:ability, Ability.create!(
      :name => "MyString",
      :description => "MyText",
      :is_ultimate => false,
      :hero => nil
    ))
  end

  it "renders the edit ability form" do
    render

    assert_select "form[action=?][method=?]", ability_path(@ability), "post" do

      assert_select "input#ability_name[name=?]", "ability[name]"

      assert_select "textarea#ability_description[name=?]", "ability[description]"

      assert_select "input#ability_is_ultimate[name=?]", "ability[is_ultimate]"

      assert_select "input#ability_hero_id[name=?]", "ability[hero_id]"
    end
  end
end
