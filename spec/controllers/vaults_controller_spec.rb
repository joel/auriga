require 'rails_helper'

RSpec.describe VaultsController, type: :controller do
  let(:user)               { create(:user, :confirmed) }
  let(:valid_attributes)   { { subdomain: 'me' } }
  let(:subdomain)          { valid_attributes[:subdomain] }
  let(:invalid_attributes) { { subdomain: nil } }

  before { sign_in user }

  before(:each) do
    @request.host = "#{subdomain}.auriga.dev"
  end

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the created vault" do
        expect {
          post :create, { vault: valid_attributes }, valid_session
        }.to change(Vault, :count).by(+1)
        expect(response).to redirect_to(goldbricks_url(subdomain: Vault.last.subdomain))
        expect(user.reload).to be_vault
        expect(user.vault.subdomain).to eql('me')
      end
    end
  end

end
