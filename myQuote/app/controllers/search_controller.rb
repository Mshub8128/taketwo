class SearchController < ApplicationController
  def index
    category_query = params[:category_query]
    if category_query.present?
      @quotematch = Quote.joins(:quote_categories, :categories).where("categories.catname LIKE ?", "%#{category_query}%").distinct

    end
  end
end
