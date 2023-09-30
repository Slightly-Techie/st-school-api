require 'rails_helper'

RSpec.describe "Stacks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/stack/index"
      expect(response).to have_http_status(:success)
    end
  end

end
