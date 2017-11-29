require 'rails_helper'

RSpec.describe "heros#index", type: :request do
  context 'basic fetch' do
    let!(:hero1) { create(:hero) }
    let!(:hero2) { create(:hero) }

    it 'serializes the list correctly' do
      get "/api/v1/heros"

      expect(json_ids(true)).to match_array([hero1.id, hero2.id])
      assert_payload(:hero, hero1, json_items[0])
      assert_payload(:hero, hero2, json_items[1])
    end
  end
end
