class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items

  before_create :generate_uid

  def total_price
    cart_items.joins(:item).sum('cart_items.quantity * items.price')
  end

  private

  def generate_uid
    self.uid = SecureRandom.uuid
  end

end
