class Room < ApplicationRecord
    has_many :messages
    belongs_to :user
    has_many :post_images,dependent: :destroy
    # has_secure_password
    has_secure_password validations: false
    validate(on: :update) do |record|
        record.errors.add(:password, :blank) unless record.password_digest.present?
    end
    validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, on: :update
    validates_confirmation_of :password, allow_blank: true, on: :update
end
