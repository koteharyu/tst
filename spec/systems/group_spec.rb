require 'rails_helper'

RSpec.describe 'Group', type: :system do
  let!(:group_1) { create(:group, name: "group_1")}
  let!(:group_2) { create(:group, name: "group_2")}
  let!(:member_1) { create(:member, name: "member_1")}
  let!(:member_2) { create(:member, name: "member_2")}
  let!(:member_3) { create(:member, name: "member_3")}
  let!(:member_4) { create(:member, name: "member_4")}
  let!(:group_member) { create(:group_member, group_id: group_1.id, member_id: member_1.id)}
  let!(:group_member) { create(:group_member, group_id: group_2.id, member_id: member_1.id)}
  let!(:group_member) { create(:group_member, group_id: group_2.id, member_id: member_2.id)}
  let!(:group_member) { create(:group_member, group_id: group_2.id, member_id: member_3.id)}
  let!(:group_member) { create(:group_member, group_id: group_2.id, member_id: member_4.id)}

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
      click_link("participate-#{member_2.id}")
      expect(current_path).to eq group_path(group_1)
      expect(page).to have_content 'メンバーが増えました'
    end

    # it '脱退に成功すること' do
    #   visit group_path(group_1)
    #   click_link("remove-#{member_1.id}")
    #   expect(current_path).to eq group_path(group_1)
    #   expect(page).to have_content 'メンバーが減りました'
    # end

    context '参加メンバーが２人未満の場合' do
      it '幹事を設定するが非表示であること' do
        visit group_path(group_1)
        expect(page).to_not have_content '幹事を設定する'
      end
    end

    # context '参加メンバーが２人以上の場合' do
    #   it '幹事を設定するが表示されること' do
    #     visit group_path(group_2)
    #     expect(page).to have_content '幹事を設定する'
    #   end
    # end

  end
end
