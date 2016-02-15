class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :in_reply_to_user_id
      t.text :text
      t.references :user, index: true

      t.timestamps
    end
  end
end
