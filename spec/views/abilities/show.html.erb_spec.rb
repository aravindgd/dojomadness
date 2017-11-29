require 'rails_helper'

RSpec.describe "abilities/show", type: :view do
  before(:each) do
    @ability = assign(:ability, Ability.create!(
      :name => "Name",
      :description => "MyText",
      :is_ultimate => false,
      :hero => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
