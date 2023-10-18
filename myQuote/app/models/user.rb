class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_many :quotes, dependent: :destroy   
end

