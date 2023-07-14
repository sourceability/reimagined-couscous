class WebhookTarget < ApplicationRecord
    validates :token, presence: true, uniqueness: true
    before_create :generate_token

    def generate_token
        self.token ||= SecureRandom.uuid if self.token.nil?
    end
end
