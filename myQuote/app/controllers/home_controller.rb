class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:sources).take(5)
  end
end