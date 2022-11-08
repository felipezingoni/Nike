class CreateSneakers < ActiveRecord::Migration[7.0]
  def change
    create_table :sneakers do |t|
      t.string   "name"
      t.string   "status"
      t.string   "description"
      t.string   "model"
      t.integer   "price"
      t.timestamps
    end
  end
end
