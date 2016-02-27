class RenameInReplayToUserIdColumnToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :in_replay_to_user_id, :in_reply_to_user_id
  end
end
