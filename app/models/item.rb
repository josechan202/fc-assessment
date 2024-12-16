class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :cart_items
end
