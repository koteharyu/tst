require 'rails_helper'

RSpec.describe 'Group', type: :system do
  let!(:group_1) { create(:group, name: "group_1")}
  let!(:member_1) { create(:member, name: "member_1")}
  let!(:group_member) { create(:group_member, group_id: group_1.id, member_id: member_1.id)}
  let!(:member_2) { create(:member, name: "member_2")}
  describe 'groups/index' do
    it 'グループ一覧の取得に成功すること' do
      visit groups_path
      expect(page).to have_content 'group_1'
    end
  end

  describe 'groups/show' do
    it '参加中のメンバー取得に成功すること' do
      visit group_path(group_1)
      expect(page).to have_content "member_1"
    end

    it '未参加のメンバー取得に成功すること' do
      visit group_path(group_1)
      expect(page).to have_content "member_2"
    end

    it '参加に成功すること' do
      visit group_path(group_1)
      click_link "参加"
      expect(current_path).to eq group_path(group_1)
      expect(page).to have_content 'メンバーが増えました'
    end

    it '脱退に成功すること' do
      visit group_path(group_1)
      click_link "脱退"
      expect(current_path).to eq group_path(group_1)
      expect(page).to have_content 'メンバーが減りました'
    end
  end
end
