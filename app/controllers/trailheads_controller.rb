class TrailheadsController < ApplicationController

    def index
        @trailheads = Trailhead.all
    end

    def show
        @trailhead = Trailhead.find(params[:id])
        @hikes = @trailhead.hikes
    end

    def hikes_index
        @trailhead = Trailhead.find(params[:id])
        @hikes = @trailhead.hikes
        render template: 'hikes/index'
    end
     
    def hike
        @trailhead = Trailhead.find(params[:id])
        @hike = Hike.find(params[:hike_id])
        render template: 'hikes/show'
    end

end
