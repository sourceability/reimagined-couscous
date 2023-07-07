class CreateWebhookTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_targets do |t|
      t.string :repository
      t.string :token

      t.timestamps
    end
    add_index :webhook_targets, :token, unique: true
  end
end
