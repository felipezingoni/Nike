class AddStripeAttributesToSneakers < ActiveRecord::Migration[7.0]
  def change
    add_column :sneakers, :stripe_pricing_id, :string
    add_column :sneakers, :stripe_product_id, :string
  end
end
