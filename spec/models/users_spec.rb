require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { create(:user) }

  describe 'バリデーション' do
    it 'nameとemailとpassword全ての値が設定されていればテストが通る' do
      expect(user.valid?).to eq true
    end

    it 'nameが空だとエラーになる' do
      user.name = ''
      expect(user.valid?).to eq false
    end

    it 'emailが空だとエラーになる' do
      user.email = ''
      expect(user.valid?).to eq false
    end

    it 'passwordが空だとエラーになる' do
      user.email = ''
      expect(user.valid?).to eq false
    end
  end
end