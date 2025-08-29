class SearchController < ApplicationController
  def index
    category_query = params[:category_query] #    # To retrieve the category query parameter 
 # Search for quotes that match the entered category query
    @quotematch = Quote.includes(:categories).joins(quote_categories: :category).where("quotes.quoteText LIKE :query OR categories.categoryName LIKE :query", query: "%#{category_query}%").distinct
  end
end
