class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:source).take(5)
  end
  def uqoutes
    @quotes = Quote.include(:sources, :categories).where(user_id: session[:user_id])
  end
end