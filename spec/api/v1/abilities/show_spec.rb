require 'rails_helper'

RSpec.describe "abilities#show", type: :request do
  context 'basic fetch' do
    let!(:ability) { create(:ability) }

    it 'serializes the resource correctly' do
      get "/api/v1/abilities/#{ability.id}"

      assert_payload(:ability, ability, json_item)
    end
  end
end
