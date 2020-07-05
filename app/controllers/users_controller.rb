class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @hikes = @user.hikes
        @trip_reports = @user.trip_reports
        @check_ins = @user.check_ins
        @trailheads = @user.trailheads
    end
    
end