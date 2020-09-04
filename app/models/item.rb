class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :preparation_day

  validates :image, :category_id, :condition_id, :postage_payer_id, :shipping_origin_id, :preparation_day_id, :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }

  with_options presence: true do
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of range' }

    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postage_payer_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_origin_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
