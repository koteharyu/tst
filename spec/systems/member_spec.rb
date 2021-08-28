require 'rails_helper'

RSpec.describe 'Member', type: :system do
  let!(:member_1) { create(:member, name: "member_1") }
  describe 'members/index' do
    it 'メンバー一覧の取得に成功すること' do
      visit members_path
      expect(page).to have_content 'member_1'
    end
  end
end
