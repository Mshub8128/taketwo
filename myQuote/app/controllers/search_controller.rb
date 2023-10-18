#this controller uses a query to display results based on category name (or part thereof) searched.
class SearchController < ApplicationController
  def index
    category_query = params[:category_query]
    if category_query.present? && Quote.where(ispublic: true)
      @quotematch = Quote.joins(:quote_categories, :categories).where("categories.catname LIKE ?", "%#{category_query}%").distinct
    end
  end
end
