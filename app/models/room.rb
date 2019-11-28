class Room < ApplicationRecord
    has_many :messages
    belongs_to :user
    has_many :post_images,dependent: :destroy

end
