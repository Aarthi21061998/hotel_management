class BookingController < ApplicationController
    before_action :generate
    def index
        booking = Booking.all
        render json: booking, status:200
    end
    def create
        a = Booking.new(
         custmer_id: h1[:custmer_id],
         accodamation_id: h1[:accodamation_id]
         )
            if a.save
             render json: a, status: 200
            else
             render json: 
                  a.errors.details
            end    
    end 
    def update
        booking = Booking.find_by(id: params[:id])
        if booking
          booking.update(custmer_id: params[:custmer_id], accodamation_id: params[:accodamation_id])
          render json: "update successfully"
        else
          render json:{
            error: "not updated"
          }, status: 404
        end
    end
    def destroy
        booking = Booking.find_by(id: params[:id])
        if booking
         booking.destroy
         render json: "deleted successfully"
        end
    end
    def search
        a = Booking.joins(:custmer,:accodamation).where("name LIKE?", "%#{params[:search]} %").select(" custmers.id, custmers.name ")
        render json: a, status: 200
    end   
    def show
        a = Booking.joins(:custmer,:accodamation).where(id: params[:id]).select("custmers.id, custmers.name, custmers.email_id, custmers.phone_num, accodamations.id, accodamations.room_type, accodamations.room_number, accodamations.parking_type, accodamations.food_acc, accodamations.offer")
        b = []
        a.each do |aa|
         c = {} 
         c[:id] = aa.id
         c[:name] = aa.name
         c[:email_id] = aa.email_id
         c[:phone_num] = aa.phone_num
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
        private
        def h1
                params.require(:booking).permit([
                    :custmer_id,
                    :accodamation_id
                ])
        end    
end

        
   