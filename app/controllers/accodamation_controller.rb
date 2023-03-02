class AccodamationController < ApplicationController
    before_action :generate
    def index
        accodamation = Accodamation.all
        render json: accodamation, status:200
    end
    def create
        accodamation = Accodamation.new(        
        hotel_id: h1[:hotel_id],
        room_type: h1[:room_type],
        room_number: h1[:room_number] ,  
        parking_type: h1[:parking_type],
        food_acc: h1[:food_acc],  
        offer: h1[:offer] 
            )
            if accodamation.save
                render json: accodamation, status: 200
            else
                render json: accodamation.errors.details
                 end
        end
    def list
        a = Hotel.joins(:accodamations).where("name LIKE?", "%#{params[:search]}%").select("hotels.id,hotels.name,hotels.address,accodamations.room_type,accodamations.room_number,accodamations.parking_type,accodamations.food_acc,accodamations.offer")
        render json: a, status: 200
     end
    def show
        a = Hotel.joins(:accodamations).where(id: params[:id]).select("hotels.id,hotels.name,hotels.address,accodamations.room_type,accodamations.room_number , accodamations.parking_type,accodamations.food_acc,accodamations.offer")
         b=[]
        a.each do |aa|
        c = {}
        c[:name] = aa.name
        c[:address] = aa.address
        c[:room_number] = aa.room_number
        c[:room_type]  = aa.room_type
        c[:parking_type] = aa.parking_type
        c[:food_acc] = aa.food_acc
        c[:offer] = aa.offer
            if aa.room_number < 100
                c[:result] = "rooms avaliable"
            else
                c[:result] = " rooms not avaliable"
            end
            b<< c
        end
        render json: b, status: 200
    end
    def room
        a = Hotel.joins(:accodamations).all.select("hotels.id,hotels.name,hotels.address,accodamations.id,accodamations.room_type,accodamations.room_number, accodamations.parking_type, accodamations.food_acc,accodamations.offer")
        b = []
        a.each do |aa|
        c = {}
        c[:id] = aa.id
        c[:name] = aa.name
        c[:address] = aa.address
        c[:room_number] = aa.room_number
        c[:room_type]  = aa.room_type
        c[:parking_type] = aa.parking_type
        c[:food_acc] = aa.food_acc
        c[:offer] = aa.offer
            if aa.room_number < 100
                c[:result] = "rooms avaliable"
            else
                c[:result] = " rooms not avaliable"
            end
            b<< c
        end
        render json: b, status: 200
    end

    def update
        accodamation = Accodamation.find_by(id: params[:id])
        if accodamation
          accodamation.update(room_number: params[:room_number], room_type: params[:room_type],p arking_type: params[:parking_type], food_acc: params[:food_acc], offer: params[:offer])
          render json: "update successfully"
        else
          render json:{
            error: "not updated"
          }, status: 404
        end
      end
    def destroy
        accodamation = Accodamation.find_by(id: params[:id])
        if accodamation
         accodamation.destroy
         render json: "deleted successfully"
        end
    end
    private
    def h1
        params.require(:accodamation).permit(:hotel_id, :room_type, :room_number, :parking_type, :food_acc, :offer)
    end
end

