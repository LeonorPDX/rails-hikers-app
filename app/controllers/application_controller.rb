class ApplicationController < ActionController::Base
    def home 
        if params[:query]
            @hikes = Hike.search(params[:query])
            @trailheads = Trailhead.search(params[:query])
        end
    end
end
