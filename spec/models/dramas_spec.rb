require 'rails_helper'

RSpec.describe Drama, type: :model do

  let(:user_a) { create(:user) }
  let(:drama)  { create(:drama, user: user_a) }

  describe 'バリデーション' do
    it 'titleとdescriptionとimageの全ての値が設定されていればテストが通る' do
      expect(drama.valid?).to eq true
    end

    it 'titleが空だとエラーになる' do
      drama.title = ''
      expect(drama.valid?).to eq false
    end

    it 'descriptionが空だとエラーになる' do
      drama.description = ''
      expect(drama.valid?).to eq false
    end

    it 'imageが空だとエラーになる' do
      drama.image = ''
      expect(drama.valid?).to eq false
    end
  end
end