class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:source).reverse_order.where(ispublic: true ).take(5)
  end
  def uquotes
    @quotes = Quote.includes(:source, :categories).where(user_id: session[:user_id])
  end
end