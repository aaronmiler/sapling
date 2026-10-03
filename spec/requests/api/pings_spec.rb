require 'rails_helper'

RSpec.describe "Api::Pings", type: :request do
  describe "GET /api/pings" do
    it "returns a pong with a timestamp" do
      get "/api/pings"

      expect(response).to have_http_status(200)
      expect(response.parsed_body).to include("message" => "pong", "served_at" => be_present)
    end
  end
end
