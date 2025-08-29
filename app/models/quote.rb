class Quote < ApplicationRecord
  # A quote is owned by a user
  belongs_to :user
  # A quote is also attributed to a philosopher
  belongs_to :philosopher
  # Quotes can have many categories through the quote_categories join table.
  # If a quote is deleted, its associated quote_categories would also be deleted.
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories
  # Accepts nested attributes for quote categories, allowing quote categories to be
  # created and or updated along with the quote. Rejects any categories attributes if everything is blank.
  accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true
  # checks if a philosopher has been added to the quote
  validates :philosopher_id, presence: true
end
