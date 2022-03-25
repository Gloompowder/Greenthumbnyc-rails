class Api::V1::VisitsController < ApplicationController
    before_action :find_visit, only: [:show, :update, :destroy]

    def index
        @visits = Visit.all
        render json: @visits
    end
    
    def show 
        render json: @visit
    end

    def create
        @visit = visit.new(visit_params)
        if @visit.save
            render json: @visit
        else
            render error: {error: "Unable to create visit."}, status: 400
        end
    end

    def update
        if @fact
            fact.update(fact_params)
            render json: {message: "Visit successfully updated."}, status: 200
        else 
            render json: {error: "Visit update unsuccessful."}, status: 400
        end
    end

    def destroy
        if @fact
            @fact.destroy
            render json: {message: "Visit successfully deleted."}, status: 200
        else
            render json: {error: "Visit delete unsuccessful."}, status: 400
        end
    end

    private 

    def visit_params 
        params.require(:fact).permit(:name, :assemblydist, :borough, :communityboard, :congressionaldist, :coundist, :juris, :parksid,
        :policeprecinct, :status, :statesenatedist, :zipcode, :openhrssa, :openhrssu)
    end

    def find_fact
        @fact = Fact.find(params[:id])
    end
end