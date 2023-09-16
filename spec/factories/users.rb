FactoryBot.define do
  factory :user do
    nickname              { 'nao' }
    email                 { Faker::Internet.free_email }
    password              { '12345ab' }
    password_confirmation { password }
    family_name           { '清田' }
    family_name_kana      { 'セイダ' }
    first_name            { '菜緒' }
    first_name_kana       { 'ナオ' }
    birth_day             { '1993-06-01' }
  end
end
