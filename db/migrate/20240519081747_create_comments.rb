class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :article, null: false
      t.text :contents

      t.timestamps
    end
  end
end
