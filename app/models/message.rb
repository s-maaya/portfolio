class Message < ApplicationRecord
    belongs_to :room , required: false
    belongs_to :user , required: false
end
