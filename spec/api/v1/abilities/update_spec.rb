require 'rails_helper'

RSpec.describe "abilities#update", type: :request do
  context 'basic update' do
    let!(:ability) { create(:ability) }

    let(:payload) do
      {
        data: {
          id: ability.id.to_s,
          type: 'abilities',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        jsonapi_put "/api/v1/abilities/#{ability.id}", payload
      }.to change { ability.reload.attributes }
      assert_payload(:ability, ability, json_item)

      # ... assert updates attributes ...
    end
  end
end
