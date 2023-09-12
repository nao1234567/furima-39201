FactoryBot.define do
  factory :user do
    nickname              { 'nao' }
    email                 { 'sample@gmail.com' }
    password              { '12345ab' }
    password_confirmation { '12345ab' }
    family_name           { '清田' }
    family_name_kana      { 'セイダ' }
    first_name            { '菜緒' }
    first_name_kana       { 'ナオ' }
    birth_day             { '1993-06-01' }
  end
end
