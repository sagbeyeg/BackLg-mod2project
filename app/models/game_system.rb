class GameSystem < ApplicationRecord
    belongs_to :system
    belongs_to :game
    validates_uniqueness_of :game_id, :scope => [:system_id]
end
