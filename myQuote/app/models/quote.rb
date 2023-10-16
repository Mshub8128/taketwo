class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :source
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories
  accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true
end
