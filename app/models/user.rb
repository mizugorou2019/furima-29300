class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :name, presence: true, length: { maximum: 40 }
  validates :password, presence: true, length: { minimum: 6 } 

  validates :birth_day, presence: true

  with_options presence: true do
    validates :name, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }

    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'needs alphabet and number'}

    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }

    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is valid. Input full-width katakana characters.' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is valid. Input full-width katakana characters.' }

  end
end