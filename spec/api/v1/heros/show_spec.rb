require 'rails_helper'

RSpec.describe "heroes#show", type: :request do
  context 'basic fetch' do
    let!(:hero) { create(:hero) }

    it 'serializes the resource correctly' do
      get "/api/v1/heroes/#{hero.id}"

      assert_payload(:hero, hero, json_item)
    end
  end
end
