class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members

  validates :name, presence: true

  # scope :set_target_member, -> { joins(:group_members)&.where(group_id: @group.id, role: 0).sample}

  def set_current_organizer
    self.group_members&.find_by(group_id: id, role: 1)
  end

  def set_target_member
    self.group_members&.where(group_id: id, role: 0).sample
  end

  def set_target_member_name(target_member)
    self.members.find(target_member.member_id).name
  end
end
