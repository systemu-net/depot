class StoreController < ApplicationController
  include CurrentCounter

  before_action :set_counter, only: %i[ index ]

  def index
    @products = Product.order(:title)
  end
end
