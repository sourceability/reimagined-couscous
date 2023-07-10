class NotifySlackJob < ApplicationJob
  queue_as :default

  def perform(user:, author:, comment:)
    g = Gitlab.client(private_token: 'glpat-JXL2yitakTxyDV7LA_c2', endpoint: 'http://gitlab.com/api/v4')
    author = g.user(author_id)
    Resque.logger.info "Hey #{user.name}, #{author.name} commented #{comment}"
  end
end
