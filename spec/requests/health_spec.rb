require 'rails_helper'

RSpec.describe "Health", type: :request do
  describe "GET /up" do
    it "returns a 200 response" do
      get "/up"

      expect(response).to have_http_status(200)
    end
  end
end
