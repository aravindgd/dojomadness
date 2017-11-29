require 'rails_helper'

RSpec.describe "heros/show", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :name => "Name",
      :real_name => "Real Name",
      :health => 2,
      :armour => 3,
      :shield => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Real Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
