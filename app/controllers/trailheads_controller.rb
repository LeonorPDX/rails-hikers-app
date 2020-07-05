class TrailheadsController < ApplicationController
    before_action :authenticate_user!

    def index
        @trailheads = Trailhead.all
    end

    def show
        @trailhead = Trailhead.find(params[:id])
        @hikes = @trailhead.hikes
        @check_ins = @trailhead.check_ins
    end
     
    def hike
        @trailhead = Trailhead.find(params[:id])
        @hike = Hike.find(params[:hike_id])
        render template: 'hikes/show'
    end

    def new
        @trailhead = Trailhead.new
    end

    def create
        @trailhead = Trailhead.new(trailhead_params)

        if @trailhead.valid?
            @trailhead.save
            redirect_to trailhead_path(@trailhead)
        else
            render :new
        end
    end

    private

    def trailhead_params
        params.require(:trailhead).permit(   :name,
                                            :location,
                                            :amenities,
                                            :fees)
    end

end
