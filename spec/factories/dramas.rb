FactoryBot.define do
  factory :drama do
    title { 'テスト' }
    description { 'test' }
    image { 'test.jpg' }
    user
  end
end