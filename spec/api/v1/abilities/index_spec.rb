require 'rails_helper'

RSpec.describe "abilities#index", type: :request do
  context 'basic fetch' do
    let!(:ability1) { create(:ability) }
    let!(:ability2) { create(:ability) }

    it 'serializes the list correctly' do
      get "/api/v1/abilities"

      expect(json_ids(true)).to match_array([ability1.id, ability2.id])
      assert_payload(:ability, ability1, json_items[0])
      assert_payload(:ability, ability2, json_items[1])
    end
  end
end
