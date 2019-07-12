require 'rails_helper'

RSpec.feature 'TopPages', type: :system do
  
  it 'トップページから登録ページへ行ける' do
    visit root_path
    click_on '早速登録！'
    expect(current_path).to eq signup_path
  end

  it 'トップページからログインページへ行ける' do
    visit root_path
    click_on '早速登録！'
    expect(current_path).to eq signup_path
  end

end
