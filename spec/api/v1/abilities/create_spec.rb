require 'rails_helper'

RSpec.describe "abilities#create", type: :request do
  context 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'abilities',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        jsonapi_post "/api/v1/abilities", payload
      }.to change { Ability.count }.by(1)
      ability = Ability.last

      assert_payload(:ability, ability, json_item)
    end
  end
end
