class Member < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :role, through: :group_members

  validates :name, presence: true

  scope :not_participated_members, -> (group_member_ids) { where.not(id: group_member_ids)}
end
