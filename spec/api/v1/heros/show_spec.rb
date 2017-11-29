require 'rails_helper'

RSpec.describe "heros#show", type: :request do
  context 'basic fetch' do
    let!(:hero) { create(:hero) }

    it 'serializes the resource correctly' do
      get "/api/v1/heros/#{hero.id}"

      assert_payload(:hero, hero, json_item)
    end
  end
end
