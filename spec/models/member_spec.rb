require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'nameが空欄の場合' do
    it 'バリデーションに引っかかること' do
      expect(build(:member, name: nil)).to_not be_valid
    end
  end
end
