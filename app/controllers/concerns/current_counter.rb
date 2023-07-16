module CurrentCounter
  extend ActiveSupport::Concern

  private

  def set_counter
    session[:counter_id] += 1
  rescue NoMethodError
    session[:counter_id] = 0
  end

  def update_counter(value = 0)
    session[:counter_id] = value
  end
end