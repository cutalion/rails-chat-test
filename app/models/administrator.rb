class Administrator < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
end
