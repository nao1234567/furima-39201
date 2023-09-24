FactoryBot.define do
  factory :purchase_delivery do
        post_code { '123-1234'}
        prefecture_id { 3 }
        city { '広島県広島市' }
        street_address { '1-2' }
        building_name { 'ビル' }
        phone_number { '09012341234' }
        token {"tok_abcdefghijk00000000000000000"}
    
        association :user_id
        association :product_id
  end
end
