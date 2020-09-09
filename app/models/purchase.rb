class Purchase < ApplicationRecord
  has_one :delivery
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true
end