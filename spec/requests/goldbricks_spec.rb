require 'rails_helper'

RSpec.describe "Goldbricks", type: :request, skip: true do
  let(:vault)  { create(:vault) }

  before do
    @request.subdomain = vault.subdomain
  end


  describe 'GET /goldbricks' do
    it 'works!' do
      get goldbricks_url(subdomain: vault.subdomain)
      expect(response.status).to be(200)
    end
  end
end
