class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:source).take(5)
  end
end