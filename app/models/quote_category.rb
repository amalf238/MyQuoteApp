class QuoteCategory < ApplicationRecord
  # Each QuoteCategory belongs to a single Quote
  belongs_to :quote
  # Each QuoteCategory also belongs to a single Category
  belongs_to :category
  # Makes sure that a category_id and quote_id is always there when creating or updating a QuoteCategory
  validates :category_id, presence: true
end
