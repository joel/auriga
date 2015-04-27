require 'rails_helper'

RSpec.describe "Vaults", type: :request do
  describe "GET /vaults" do
    it "works! (now write some real specs)" do
      get vaults_path
      expect(response).to have_http_status(200)
    end
  end
end
