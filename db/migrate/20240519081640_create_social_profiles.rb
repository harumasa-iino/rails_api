class CreateSocialProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :social_profiles do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :raw_info
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
