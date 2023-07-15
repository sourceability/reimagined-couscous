class AddOwnerToWebhookTargets < ActiveRecord::Migration[7.0]
  def change
    add_reference :webhook_targets, :user, null: false, foreign_key: true
  end
end
