class CreateGitlabUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :gitlab_users do |t|
      t.string :name
      t.integer :gitlab_id

      t.timestamps
    end
    add_index :gitlab_users, :gitlab_id, unique: true
  end
end
