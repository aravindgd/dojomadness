require 'rails_helper'

RSpec.describe "heros/edit", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :name => "MyString",
      :real_name => "MyString",
      :health => 1,
      :armour => 1,
      :shield => 1
    ))
  end

  it "renders the edit hero form" do
    render

    assert_select "form[action=?][method=?]", hero_path(@hero), "post" do

      assert_select "input#hero_name[name=?]", "hero[name]"

      assert_select "input#hero_real_name[name=?]", "hero[real_name]"

      assert_select "input#hero_health[name=?]", "hero[health]"

      assert_select "input#hero_armour[name=?]", "hero[armour]"

      assert_select "input#hero_shield[name=?]", "hero[shield]"
    end
  end
end
