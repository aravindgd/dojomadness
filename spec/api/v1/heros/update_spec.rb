require 'rails_helper'

RSpec.describe "heroes#update", type: :request do
  context 'basic update' do
    let!(:hero) { create(:hero) }

    let(:payload) do
      {
        data: {
          id: hero.id.to_s,
          type: 'heroes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        jsonapi_put "/api/v1/heroes/#{hero.id}", payload
      }.to change { hero.reload.attributes }
      assert_payload(:hero, hero, json_item)

      # ... assert updates attributes ...
    end
  end
end
