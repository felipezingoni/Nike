class RemoveArticlesIdsToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :article_ids, :json, default: []
  end
end
