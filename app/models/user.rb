class User < ApplicationRecord
    def self.from_omniauth(auth_hash)
        User.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |u|
            u.name = auth_hash['info']['name']
            u.image_url = auth_hash['info']['image']
        end
    end
end
