class WebhookTarget < ApplicationRecord
    after_initialize :generate_token

    attr_accessor :repository, :token, :last_called_at

    validates :token, presence: true, uniqueness: true

    private
    def generate_token
        self.token = SecureRandom.uuid if self.token.nil?
    end
end
