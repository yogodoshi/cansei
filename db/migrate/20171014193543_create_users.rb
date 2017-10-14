class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, index: true, null: false
      t.string :uid, index: true, null: false
      t.string :username, null: false
      t.string :token, null: false
      t.string :secret, null: false
      t.string :profile_image, null: false
      t.integer :frequency, default: 0, null: false

      t.timestamps
    end
  end
end
