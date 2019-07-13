require 'rails_helper'

RSpec.feature 'Dramas', type: :system do

  let!(:user) { create(:user) }
  let!(:drama) { create(:drama, image: 'signal.jpg', user: user) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: 'text1@example.com'
    fill_in 'パスワード',     with: 'password'
    click_button 'ログインする！'
  end
  
  it 'ドラマの投稿に成功' do
    find('.navbar-toggler-icon').click 
    click_on 'ドラマ一覧'
    expect(page).to have_content 'テスト'
  end

  it 'ドラマを削除する' do
    find('.navbar-toggler-icon').click 
    click_on 'Account'
    click_on 'プロフィール'
    click_on '削除する'
  end

end
