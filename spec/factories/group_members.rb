FactoryBot.define do
  factory :group_member do
    group
    member
    role { 0 }
  end
end
