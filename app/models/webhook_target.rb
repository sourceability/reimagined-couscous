class WebhookTarget < ApplicationRecord
    validates :token, presence: true, uniqueness: true
    before_validation :generate_token
    belongs_to :user
    scope :all_for_user, ->(user) { where(user: user) }

    def generate_token
        self.token ||= SecureRandom.uuid if self.token.nil?
    end
end
