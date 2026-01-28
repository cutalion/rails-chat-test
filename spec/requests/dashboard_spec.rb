require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET /dashboard' do
    context 'when not logged in' do
      it 'redirects to login' do
        get dashboard_path
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do
      let!(:user) { create(:user, nickname: 'alice') }

      it 'shows the dashboard' do
        login_as_user(user)
        get dashboard_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('alice')
      end
    end
  end
end
