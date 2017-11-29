require 'rails_helper'

RSpec.describe "Abilities", type: :request do
  let!(:abilities) { create_list(:ability, 5)}
  describe "GET /abilities" do
    it "list all the abilities" do
      get abilities_path
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"].count).to eql 5
      expect(json_response["data"].first["attributes"].keys.sort).to eql ["description", "hero", "is_ultimate", "name"]
    end
  end
  describe "GET /abilities/:id" do
    it "displays the data of one ability" do
      get ability_path(id: abilities.first.id)
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["attributes"].keys.sort).to eql ["description", "hero", "is_ultimate", "name"]
      expect(json_response["data"]["id"]).to eql abilities.first.id.to_s
    end
  end
end
