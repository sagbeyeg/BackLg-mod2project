class User < ApplicationRecord
    has_many :reviews
    has_many :games, through: :reviews
    has_many :system_users
    has_many :systems, through: :system_users

    validates :name, uniqueness: true
    validates :name, :age, :username, :email, presence: true
    validates :email, uniqueness: true

    has_secure_password
end
