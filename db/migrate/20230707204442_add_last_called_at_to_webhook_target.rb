class AddLastCalledAtToWebhookTarget < ActiveRecord::Migration[7.0]
  def change
    add_column :webhook_targets, :last_called_at, :datetime
  end
end
