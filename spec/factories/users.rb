FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'テストメール' }
    password { 'テストパスワード' }
  end
end
