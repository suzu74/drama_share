FactoryBot.define do
  factory :drama do
    title { 'テスト' }
    description { 'test' }
    image { 'test' }
    user
  end
end