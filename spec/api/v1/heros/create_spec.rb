require 'rails_helper'

RSpec.describe "heroes#create", type: :request do
  context 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'heroes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        jsonapi_post "/api/v1/heroes", payload
      }.to change { Hero.count }.by(1)
      hero = Hero.last

      assert_payload(:hero, hero, json_item)
    end
  end
end
