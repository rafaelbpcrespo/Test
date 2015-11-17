class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    if current_user.order_in_progress.nil?
      Order.find(current_user.order_in_progress.id)
    else
      Order.new
    end
  end
end
