class Room < ApplicationRecord
    has_many :messages
    belongs_to :user
    attachment :image
end
