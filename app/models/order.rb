class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :sneakers, through: :order_items

  after_save :add_sneaker_to_user

  def add_sneaker_to_user
    user.sneakers_ids += order_items.pluck(:sneaker_id)
    user.save
  end
end
