class Product < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :status

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than: 299, less_than: 10_000_000 }
end
