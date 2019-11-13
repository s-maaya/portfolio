class Room < ApplicationRecord
    has_many :messages
    attachment :image
end
