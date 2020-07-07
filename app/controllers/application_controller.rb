class ApplicationController < ActionController::Base
    helper_method :set_hike, :set_trailhead


    def home 
        if params[:query]
            @hikes = Hike.search(params[:query])
            @trailheads = Trailhead.search(params[:query])
        end
    end

    def set_hike
        @hike = Hike.find(params[:id])
    end

    def set_trailhead
        @trailhead = Trailhead.find(params[:id])
    end
end
