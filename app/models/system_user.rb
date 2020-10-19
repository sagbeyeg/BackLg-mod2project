class SystemUser < ApplicationRecord
    belongs_to :user
    belongs_to :system
end
