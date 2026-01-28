require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a nickname' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid with a duplicate nickname' do
      create(:user, nickname: 'alice')
      user = build(:user, nickname: 'alice')
      expect(user).not_to be_valid
    end
  end
end
