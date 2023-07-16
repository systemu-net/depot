class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        next if quantity <= 1

        cart.line_items.where(product: product_id).delete_all

        cart.line_items.build(product_id: product_id).tap do |line_item|
          line_item.quantity = quantity
        end.save!
      end
    end
  end

  def down
    LineItem.where("quantity > 1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end

      # remove original item
      line_item.destroy
    end
  end
end
