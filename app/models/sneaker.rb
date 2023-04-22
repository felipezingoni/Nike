class Sneaker < ApplicationRecord
  has_one_attached :photo
  after_create :create_stripe_account
  acts_as_taggable_on :tags

  acts_as_taggable_on :sneakers
  $description = ["Calzado para hombre", "Calzado para Mujer", "Calzado de Basquetbol"]
  $model       = ["M1", "D20", "1 Crater Next Nature", "C45"]


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
