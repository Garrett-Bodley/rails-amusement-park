class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new(user: User.find(session[:user_id]), attraction: Attraction.find(params[:id]))
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to @attraction
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating, :id)
    end

end
