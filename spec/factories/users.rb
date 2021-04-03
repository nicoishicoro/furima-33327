FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 {Faker::Internet.free_email}
    password              { 'aaa000' }
    password_confirmation { 'aaa000' }
    last_name             { 'ああああ' }
    first_name            { 'いいいい' }
    last_name_kana        { 'アアアア' }
    first_name_kana       { 'イイイイ' }
    birth_date            { '2000/2/2' }
  end
end
