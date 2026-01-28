require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe 'validations' do
    it 'is valid with a nickname' do
      admin = build(:administrator)
      expect(admin).to be_valid
    end

    it 'is invalid without a nickname' do
      admin = build(:administrator, nickname: nil)
      expect(admin).not_to be_valid
    end

    it 'is invalid with a duplicate nickname' do
      create(:administrator, nickname: 'admin')
      admin = build(:administrator, nickname: 'admin')
      expect(admin).not_to be_valid
    end
  end
end
