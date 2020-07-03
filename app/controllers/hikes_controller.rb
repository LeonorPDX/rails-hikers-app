class HikesController < ApplicationController

    def index
        @hikes = Hike.all 
    end

    def show
        @hike = Hike.find_by(id: params[:id])
    end
    
end
