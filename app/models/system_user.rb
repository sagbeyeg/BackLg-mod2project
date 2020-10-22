class SystemUser < ApplicationRecord
    belongs_to :user
    belongs_to :system
    validates_uniqueness_of :user_id, :scope => [:system_id]
end
