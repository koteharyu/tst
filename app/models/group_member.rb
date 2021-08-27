class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :member

  enum role: { regular: 0, organizer: 1}
end
