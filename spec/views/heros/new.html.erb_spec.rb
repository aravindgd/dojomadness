require 'rails_helper'

RSpec.describe "heros/new", type: :view do
  before(:each) do
    assign(:hero, Hero.new(
      :name => "MyString",
      :real_name => "MyString",
      :health => 1,
      :armour => 1,
      :shield => 1
    ))
  end

  it "renders new hero form" do
    render

    assert_select "form[action=?][method=?]", heros_path, "post" do

      assert_select "input#hero_name[name=?]", "hero[name]"

      assert_select "input#hero_real_name[name=?]", "hero[real_name]"

      assert_select "input#hero_health[name=?]", "hero[health]"

      assert_select "input#hero_armour[name=?]", "hero[armour]"

      assert_select "input#hero_shield[name=?]", "hero[shield]"
    end
  end
end
