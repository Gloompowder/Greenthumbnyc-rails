class Api::V1::GardensController < ApplicationController
    before_action :find_garden, only: [:show, :update, :destroy]

    def index
        @gardens = Garden.all
        render json: @gardens
    end
    def show 
        render json: @garden
    end

    def create
        @garden = garden.new(garden_params)
        if @garden.save
            render json: @garden
        else
            render error: {error: "Unable to create garden."}, status: 400
        end
    end

    def update
        if @fact
            fact.update(fact_params)
            render json: {message: "Garden successfully updated."}, status: 200
        else 
            render json: {error: "Garden update unsuccessful."}, status: 400
        end
    end

    def destroy
        if @fact
            @fact.destroy
            render json: {message: "Garden successfully deleted."}, status: 200
        else
            render json: {error: "Garden delete unsuccessful."}, status: 400
        end
    end

    private 

    def garden_params 
        params.require(:fact).permit(:name, :assemblydist, :borough, :communityboard, :congressionaldist, :coundist, :juris, :parksid,
        :policeprecinct, :status, :statesenatedist, :zipcode, :openhrssa, :openhrssu)
    end

    def find_garden
        @garden = Garden.find(params[:id])
    end
    # t.string "name"
    # t.integer "assemblydist"
    # t.string "borough"
    # t.integer "communityboard"
    # t.integer "congressionaldist"
    # t.integer "coundist"
    # t.string "juris"
    # t.string "parksid"
    # t.string "policeprecinct"
    # t.string "status"
    # t.integer "statesenatedist"
    # t.integer "zipcode"
    # t.string "openhrssa"
    # t.string "openhrssu"
end
