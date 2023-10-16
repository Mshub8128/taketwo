class QuoteCategory < ApplicationRecord
  belongs_to :quote
  belongs_to :category 
  validates :category, presence: true
end
