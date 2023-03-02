class HotelController < ApplicationController
    before_action :generate
    def index
        hotel = Hotel.page(params[:page]).per(2)
        render json: hotel, status: 200
    end
    def show
        hotel = Hotel.find_by(id: params[:id])
        if hotel
            render json: hotel, status: 200
        else
            render json:{
                error: "hotel not found"
            }, status: 404
        end
    end
    def create
        hotel = Hotel.new(
         name: h1[:name],
         address: h1[:address]
        )
        if hotel.save
            render json: hotel, status: 200
        else
            render json: 
                hotel.errors.details
        end    
    end
    def update
        hotel = Hotel.find_by(id: params[:id])
        if hotel
          hotel.update(name: params[:name],address: params[:address])
          render json: "update successfully"
        else
          render json:{
            error: "not updated"
          }, status: 404
        end
    end
    def destroy
        hotel = Hotel.find_by(id: params[:id])
        if hotel
         hotel.destroy
         render json: "deleted successfully"
        end
    end
    private
    def h1
        params.require(:hotel).permit([
            :name,
            :address
        ])
    end    
end
