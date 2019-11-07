class Room < ApplicationRecord
    has_many :message
    attachment :image
end
