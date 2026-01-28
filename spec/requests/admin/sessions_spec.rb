require 'rails_helper'

RSpec.describe 'Admin Sessions', type: :request do
  describe 'GET /admin/login' do
    it 'renders the login form' do
      get admin_login_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /admin/login' do
    let!(:admin) { create(:administrator, nickname: 'admin') }

    context 'with valid nickname' do
      it 'logs in and redirects to admin dashboard' do
        post admin_login_path, params: { nickname: 'admin' }
        expect(response).to redirect_to(admin_dashboard_path)
      end
    end

    context 'with invalid nickname' do
      it 'renders login form with error' do
        post admin_login_path, params: { nickname: 'unknown' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /admin/logout' do
    let!(:admin) { create(:administrator, nickname: 'admin') }

    it 'logs out and redirects to root' do
      login_as_admin(admin)
      delete admin_logout_path
      expect(response).to redirect_to(root_path)
    end
  end
end
