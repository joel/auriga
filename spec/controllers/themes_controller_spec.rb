require 'rails_helper'

RSpec.describe ThemesController, type: :controller do

  describe 'setting' do
    let(:theme) { 'My awesome theme' }

    before do
      request.env['HTTP_REFERER']= 'www.example.co.uk'
    end

    subject { patch :setting, { theme: theme } }

    it 'should set theme in session' do
      expect(subject).to have_http_status(302) # Redirection
      expect(subject).to redirect_to('www.example.co.uk')
      expect(session[:theme]).to eql(theme)
    end
  end
end
