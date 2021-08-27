class Member < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :role, through: :group_members
end
