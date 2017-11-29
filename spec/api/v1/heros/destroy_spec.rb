require 'rails_helper'

RSpec.describe "heroes#destroy", type: :request do
  context 'basic destroy' do
    let!(:hero) { FactoryGirl.create(:hero) }

    it 'updates the resource' do
      expect {
        delete "/api/v1/heroes/#{hero.id}"
      }.to change { Hero.count }.by(-1)

      expect(response.status).to eq(204)
    end
  end
end
