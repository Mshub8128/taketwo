class Source < ApplicationRecord
    has_many :quotes, dependent: :destroy
end
