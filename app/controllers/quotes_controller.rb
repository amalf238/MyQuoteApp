class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]   # Set the quote to show, edit, update, and destroy actions
  before_action :set_philosophers, only: [:new, :create, :edit, :update] 
  before_action :require_login, except: [:index, :show] # Ensures that app users cannot access methods such as delete and edit quote

  def index
  # Retrieve quotes belonging to the current user and order them by creation date in descending order
    @quotes = current_user.quotes.order(created_at: :desc) # To prevent users from editing or deleting other user's quotes
     # @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
    5.times { @quote.quote_categories.build } # Buil 5 boxes in the form to add upto 5 categories for a quote
  end

  def edit;
  end

  def create
    Rails.logger.debug "Submitted parameters: #{params.inspect}"
    @quote = Quote.new(quote_params) # To initialize a new quote object
    if @quote.save
      redirect_to quote_url(@quote), notice: "Quote was successfully created." # Save the quote and redirect the user to the quote view page if successful
    else
      render :new # if saving fails this will render a new template
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to quote_url(@quote), notice: "Quote was successfully updated." # Update quote with the entered parameters and redirect user to the quote view page
    else
      render :edit # if editing fails this will render a new template
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_url, notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def set_philosophers
    @philosophers = Philosopher.all.order(:fname)
  end

  def quote_params
    params.require(:quote).permit(:quoteText, :publicationYear, :comment, :isPublic, :user_id, :philosopher_id,
                                  quote_categories_attributes: [:id, :category_id, :_destroy])
  end
  
end
