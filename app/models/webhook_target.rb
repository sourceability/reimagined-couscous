class WebhookTarget < ApplicationRecord
    after_initialize :generate_token

    validates :token, presence: true, uniqueness: true
    validates :repository, presence: true

    private
    def generate_token
        self.token = SecureRandom.uuid if self.token.nil?
    end
end
