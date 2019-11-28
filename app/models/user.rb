class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :rooms,dependent: :destroy
    attachment :image
    has_many :messages
    has_many :post_images,dependent: :destroy

end
