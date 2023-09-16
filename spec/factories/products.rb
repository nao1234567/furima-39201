FactoryBot.define do
  factory :product do
    association :user

    name              { 'nao' }
    description       { 'ズボン' }
    category_id       { '2' }
    status_id         { '2' }
    cost_id           { '2' }
    prefecture_id     { '2' }
    shipping_date_id  { '2' }
    price             { '500' }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
