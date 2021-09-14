class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members

  validates :name, presence: true

  def current_organizer
    group_members&.organizer.first
  end

  def target_member
    group_members&.regular.sample
  end

  def target_member_name(target_member)
    target_member.member.name
  end

  def participate(member)
    members << member
  end

  def withdraw(member)
    members.destroy(member)
  end

  def not_participated_members
    Member.where.not(id: member_ids)
  end
end
