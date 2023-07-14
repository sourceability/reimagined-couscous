class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false, index: true
      t.string :uid, null: false, index: true
      t.string :name
      t.string :image_url

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
