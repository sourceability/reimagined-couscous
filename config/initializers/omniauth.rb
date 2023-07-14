Rails.application.config.middleware.use OmniAuth::Builder do
    provider :gitlab, ENV['GITLAB_KEY'], ENV['GITLAB_SECRET'], scope: 'read_user read_api'
  end
