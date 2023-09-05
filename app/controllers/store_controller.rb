class StoreController < ApplicationController
  include CurrentCounter
  include CurrentCart

  before_action :set_counter, only: %i[index]
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
