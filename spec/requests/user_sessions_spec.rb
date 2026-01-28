require 'rails_helper'

RSpec.describe 'User Sessions', type: :request do
  describe 'GET /login' do
    it 'renders the login form' do
      get login_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /login' do
    let!(:user) { create(:user, nickname: 'alice') }

    context 'with valid nickname' do
      it 'logs in and redirects to dashboard' do
        post login_path, params: { nickname: 'alice' }
        expect(response).to redirect_to(dashboard_path)
        follow_redirect!
        expect(response.body).to include('alice')
      end
    end

    context 'with invalid nickname' do
      it 'renders login form with error' do
        post login_path, params: { nickname: 'unknown' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /logout' do
    let!(:user) { create(:user, nickname: 'alice') }

    it 'logs out and redirects to root' do
      login_as_user(user)
      delete logout_path
      expect(response).to redirect_to(root_path)
    end
  end
end
