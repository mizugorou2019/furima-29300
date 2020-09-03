class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :image, :category, :condition, :postage_payer, :shipping_origin, :preparation_day, :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }

  with_options presence: true do
    # validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers" }
    # validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message:  "is out of range" }
    # validates :price, length: { within: 300..9999999, message: "is out of range" }
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of range' }

    validates :category, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition, numericality: { other_than: 1, message: "can't be blank" }
    validates :postage_payer, numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_origin, numericality: { other_than: 0, message: "can't be blank"}
    validates :preparation_day, numericality: { other_than: 1, message: "can't be blank"}
  end
end
