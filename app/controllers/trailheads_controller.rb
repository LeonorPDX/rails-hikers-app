class TrailheadsController < ApplicationController

    def index
        @trailheads = Trailhead.all
    end

    def show
        @trailhead = Trailhead.find_by(id: params[:id])
        @hikes = @trailhead.hikes
    end

end
