class HikesController < ApplicationController
    before_action :authenticate_user!

    def index
        @hikes = Hike.all 
    end

    def show
        @hike = Hike.find_by(id: params[:id])
        @trailhead = @hike.trailhead
    end

    def new
        if params[:trailhead_id] && !Trailhead.exists?(params[:trailhead_id])
          redirect_to trailheads_path, alert: "Trailhead not found."
        else
          @hike = Hike.new(trailhead_id: params[:trailhead_id])
        end
    end

    def create
        @hike = Hike.new(hike_params)
        @hike.user_id = current_user.id

        if @hike.valid?
            @hike.save
            redirect_to hike_path(@hike)
        else
            render :new
        end
    end

    def edit
        if params[:trailhead_id]
          th = Trailhead.find_by(id: params[:trailhead_id])
          if th.nil?
            redirect_to trailheads_path, alert: "Trailhead not found."
          else
            @hike = th.hikes.find_by(id: params[:id])
            redirect_to trailhead_hikes_path(th), alert: "Hike not found." if @hike.nil?
          end
        else
          @hike = Hike.find(params[:id])
        end
    end
    
    def update
        @hike = Hike.find(params[:id])
    
        @hike.update(hike_params)
    
        if @hike.save
          redirect_to @hike
        else
          render :edit
        end
    end

    private

    def hike_params
        params.require(:hike).permit(   :name,
                                        :description,
                                        :difficulty,
                                        :distance,
                                        :elevation_gain,
                                        :hike_type,
                                        :waterfalls,
                                        :wildflowers,
                                        :mountains,
                                        :beaches,
                                        :dog_friendly,
                                        :family_friendly,
                                        :trailhead_id)
    end

end
