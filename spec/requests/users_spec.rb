require 'request_helper'

describe "Users" do
  let(:user) { create(:user_with_vault, :confirmed, subdomain: 'me') }

  before { login_as user }

  describe "GET /users" do
    it "..." do
      get users_url(subdomain: user.vault.subdomain)
      expect(response.status).to be(200)
    end
  end
end
