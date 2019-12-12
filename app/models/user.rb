class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :carts
   has_many :products, through: :carts

  has_many :orders, dependent: :destroy

  enum leave_status: { alive: false, dead: true }


end
