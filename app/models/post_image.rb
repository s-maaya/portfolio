class PostImage < ApplicationRecord
    belongs_to :user
    belongs_to :room
    attachment :post_image

end
