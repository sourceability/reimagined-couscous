class WebhookTarget < ApplicationRecord
    validates :token, presence: true, uniqueness: true
    before_create :generate_token
    belongs_to :user

    def generate_token
        self.token ||= SecureRandom.uuid if self.token.nil?
    end
end
