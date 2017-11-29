require 'rails_helper'

RSpec.describe "abilities#destroy", type: :request do
  context 'basic destroy' do
    let!(:ability) { FactoryGirl.create(:ability) }

    it 'updates the resource' do
      expect {
        delete "/api/v1/abilities/#{ability.id}"
      }.to change { Ability.count }.by(-1)

      expect(response.status).to eq(204)
    end
  end
end
