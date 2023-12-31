class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :post_code ,:prefecture_id,:city,:street_address,:purchase,:building_name ,:phone_number,:product_id, :user_id, :token

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :token
  end


def save
  purchase = Purchase.create(user_id: user_id,product_id: product_id)
  Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address,building_name: building_name, phone_number: phone_number,purchase_id: purchase.id )
end

end

