shared_context 'signed user' do
  let(:user) do
    create(:user, :with_vault_and_goldbricks, :confirmed, subdomain: 'me').tap do |user|
      expect(user.vault).to be_present
      expect(user.vault.subdomain).to eql('me')
      expect(user.vault.goldbricks.count).to be_present
    end
  end
  let(:goldbrick) { user.vault.goldbricks.sample }

  before(:each) do
    host = 'me.auriga.dev'
    default_url_options[:host] = host
    Capybara.app_host = 'http://' + host
    sign_in_as user, 'secret'
    expect(current_url).to eq('http://me.auriga.dev/goldbricks')
  end
end
