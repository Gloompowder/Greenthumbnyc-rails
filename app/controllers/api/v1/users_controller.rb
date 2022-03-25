class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end
    def show 
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: {error: "Unable to create user."}, status: 400
        end
    end

    def update
        if @fact
            fact.update(fact_params)
            render json: {message: "User successfully updated."}, status: 200
        else 
            render json: {error: "User update unsuccessful."}, status: 400
        end
    end

    def destroy
        if @fact
            @fact.destroy
            render json: {message: "user successfully deleted."}, status: 200
        else
            render json: {error: "user delete unsuccessful."}, status: 400
        end
    end

    private 

    def user_params 
        params.require(:fact).permit(:name, :assemblydist, :borough, :communityboard, :congressionaldist, :coundist, :juris, :parksid,
        :policeprecinct, :status, :statesenatedist, :zipcode, :openhrssa, :openhrssu)
    end

    def find_user
        @fact = User.find(params[:id])
    end
end