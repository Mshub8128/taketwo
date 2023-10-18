#this controller uses a query to display results based on category name (or part thereof) searched.
class SearchController < ApplicationController
  def index
    category_query = params[:category_query]
    if category_query.present?
      @quotematch = Quote.joins(:quote_categories, :categories).where("categories.catname LIKE ?", "%#{category_query}%").distinct && Quote.where(ispublic: true)
    end
  end
end
