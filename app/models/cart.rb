class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.increment(:quantity)
    else
      line_items.build(product_id: product.id)
    end
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
