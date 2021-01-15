class RidesController < ApplicationController

    def create
        @ride = Ride.create(params.require(:ride).permit(:user_id, :attraction_id))
        redirect_to @ride.user, alert: @ride.take_ride
    end

end
