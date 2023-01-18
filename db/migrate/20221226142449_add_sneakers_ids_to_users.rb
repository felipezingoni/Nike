class AddSneakersIdsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sneakers_ids, :json, default: []
  end
end
