class GamesController < ApplicationController
    def index
        @games = Game.all
        if params[:search]
            @games = Game.search(params[:search])
        else
            @games = Game.all.sort
        end
    end

    def show
        @game = Game.find(params[:id])
    end
end
