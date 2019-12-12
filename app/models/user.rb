class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum leave_status: { alive: 0, dead: 1 }

   has_many :carts
   has_many :products

  has_many :orders, dependent: :destroy

end
