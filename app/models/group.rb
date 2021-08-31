class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members

  validates :name, presence: true

  def set_current_organizer
    group_members&.find_by(role: "organizer")
  end

  def set_target_member
    group_members&.regular.sample
  end

  def set_target_member_name(target_member)
    members.find(target_member.member_id).name
  end

  def participate(member)
    members << member
  end

  def withdraw(member)
    members.destroy(member)
  end
end
