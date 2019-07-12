require 'rails_helper'

RSpec.feature 'Users', type: :system do

  let!(:user) { create(:user) }
  
  it 'ユーザー登録に成功' do
    visit signup_path
    fill_in '名前',         with: 'テストユーザー'
    fill_in 'メールアドレス',        with: 'text2@example.com'
    fill_in 'パスワード（６文字以上）',     with: 'password'
    fill_in 'パスワード確認', with: 'password'
    click_button '登録する！'
    expect(page).to have_content '登録に成功しました！'
  end

  it 'ログイン成功しログアウトにも成功' do
    visit login_path
    fill_in 'メールアドレス', with: 'text1@example.com'
    fill_in 'パスワード',     with: 'password'
    click_button 'ログインする！'
    expect(page).to have_content 'ログインに成功しました！'
    find('.navbar-toggler-icon').click 
    click_on 'Account'
    click_on 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
  end

  it '名前が空なのでユーザー登録に失敗' do
      visit signup_path
      fill_in '名前',         with: ''
      fill_in 'メールアドレス',        with: 'text2@example.com'
      fill_in 'パスワード（６文字以上）',     with: 'password'
      fill_in 'パスワード確認', with: 'password'
      click_button '登録する！'
      expect(page).to have_content '名前を入力してください'
  end

  it 'ログイン失敗（メールアドレス誤り）' do
    visit login_path
    fill_in 'メールアドレス', with: 'text3@example.com'
    fill_in 'パスワード',     with: 'password'
    click_button 'ログインする！'
    expect(page).to have_content 'メールアドレスかパスワードに間違いがあります'
  end
end
