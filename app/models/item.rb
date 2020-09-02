class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :description, :price, :category, :condition, :postage_payer, :shipping_origin, :preparation_day, :user_id, presence: true

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'is out of range.' }

    validates :category, numericality: { other_than: 1 }
    validates :condition, numericality: { other_than: 1 }
    validates :postage_payer, numericality: { other_than: 1 }
    validates :shipping_origin, numericality: { other_than: 1 }
    validates :preparation_day, numericality: { other_than: 1 }
  end

end
