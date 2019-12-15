class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :carts
   has_many :products

  has_many :orders, dependent: :destroy
  has_many :deliverys

  acts_as_paranoid

  validates :email,uniqueness: true, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true,format: {with: /\A\d{7}\z/}
  validates :family_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください'}
  validates :first_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください'}
  validates :user_address, presence: true
  validates :tele_number, presence: true
  acts_as_paranoid

end
