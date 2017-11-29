require 'rails_helper'

RSpec.describe "Heroes", type: :request do
  let!(:heroes) { create_list(:hero, 3) }
  let(:abilities) { create_list(:ability, 5, hero: heroes.first)}
  describe "GET /heroes" do
    it "list all the heroes" do
      get heroes_path
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"].count).to eql 3
      expect(json_response["data"].first["attributes"].keys.sort).to eql ["armour", "health", "name", "real_name", "shield"]
    end
  end
  describe "GET /heroes/:id" do
    it "displays the data of one hero" do
      get hero_path(id: heroes.first.id)
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["attributes"].keys.sort).to eql ["armour", "health", "name", "real_name", "shield"]
      expect(json_response["data"]["id"]).to eql heroes.first.id.to_s
    end
  end
  describe "GET /heroes/:id/abilities" do
    it "displays the abilities data of one hero" do
      abilities
      get hero_abilities_path(hero_id: heroes.first.id)
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"].count).to eql 5
      expect(json_response["data"].first["attributes"].keys.sort).to eql ["description", "hero", "is_ultimate", "name"]
      expect(json_response["data"].first["id"]).to eql abilities.first.id.to_s
    end
  end
end
