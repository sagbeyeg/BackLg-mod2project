class User < ApplicationRecord
    has_many :reviews
    has_many :games, through: :reviews
    has_many :system_users
    has_many :systems, through: :system_users
    validates :name, uniqueness: true
    validates :name, :age, presence: true

    has_secure_password
end
