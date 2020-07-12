class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @hikes = @user.hikes.reverse
        @trip_reports = @user.trip_reports.reverse
        @check_ins = @user.check_ins.reverse
        @trailheads = @user.trailheads.reverse
    end
    
end