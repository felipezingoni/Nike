class Sneaker < ApplicationRecord
  has_one_attached :photo
  after_create :create_stripe_account

  def create_stripe_account
    product = Stripe::Product.create({ name: "Sneaker - #{name}" })
    pricing = Stripe::Price.create({
        product: product.id,
        unit_amount: price,
        currency: 'usd'
    })
    update(stripe_product_id: product.id, stripe_pricing_id: pricing.id)
  end
end
