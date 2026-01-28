module AuthHelpers
  def login_as_user(user)
    post login_path, params: { nickname: user.nickname }
  end

  def login_as_admin(admin)
    post admin_login_path, params: { nickname: admin.nickname }
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
end
