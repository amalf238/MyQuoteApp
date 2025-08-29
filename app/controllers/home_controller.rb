class HomeController < ApplicationController
# The index action fetches the 5 most recent quotes along with their respective categories and orders the list in decending order
  def index
    @quotes = Quote.includes(categories: :quote_categories).order(created_at: :desc).take(5)
  end
# The uquotes action fetches quotes created by the current logged in user and includes their respective categories
# The list is ordered by the descending order of the creation date
  def uquotes
    @quotes = Quote.includes(:categories).where(user_id: session[:user_id]).order(created_at: :desc)
  end
end
