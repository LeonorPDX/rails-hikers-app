class TrailheadsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_trailhead, except: [:index, :new, :create, :show]

    def index
        @trailheads = Trailhead.all.sort_by{ |th| th.name }
    end

    def show
        if params[:id] == "most-check-ins"
            @trailhead = Trailhead.most_check_ins.first
        else
            set_trailhead
        end
        @hikes = @trailhead.hikes
        @check_ins = @trailhead.check_ins.reverse
    end
     
    def hike
        @hike = Hike.find(params[:hike_id])
        render template: 'hikes/show'
    end

    def new
        @trailhead = Trailhead.new
    end

    def create
        @trailhead = Trailhead.new(trailhead_params)
        @trailhead.creator_id = current_user.id

        if @trailhead.valid?
            @trailhead.save
            redirect_to trailhead_path(@trailhead)
        else
            flash[:errors] = @trailhead.errors.full_messages
            render :new
        end
    end

    def edit
    end
    
    def update    
        @trailhead.update(trailhead_params)
    
        if @trailhead.save
          redirect_to @trailhead
        else
          flash[:errors] = @trailhead.errors.full_messages
          render :edit
        end
    end

    def destroy
      @trailhead.destroy
      redirect_to trailheads_path
    end

    private

    def trailhead_params
        params.require(:trailhead).permit(   :name,
                                            :location,
                                            :amenities,
                                            :fees)
    end

end
