class CustmerController < ApplicationController
    before_action :generate
    def index
        custmer = Custmer.all
        render json: custmer, status:200
    end
    def create
        a = Custmer.new(
         name: h1[:name],
         email_id: h1[:email_id],
         phone_num: h1[:phone_num]
        )
        if a.save
            render json: a, status: 200
        else
            render json: 
                a.errors.details
        end    
    end 
    def show
        custmer = Custmer.find_by(id: params[:id])
        if custmer
            render json: custmer, status:200
        else
            render json:{
                error: "customer not found"
            }, status: 404
        end
    end
    def update
        custmer = Custmer.find_by(id: params[:id])
        if custmer
          custmer.update(name: params[:name], email_id: params[:email_id], phone_num: params[:phone_num])
          render json: "update successfully"
        else
          render json:{
            error: "not updated"
          }, status: 404
        end
    end
    def destroy
        custmer = Custmer.find_by(id: params[:id])
        if custmer
         custmer.destroy
         render json: "deleted successfully"
        end
    end
    private
    def h1
        params.require(:custmer).permit([
            :name,
            :email_id,
            :phone_num
        ])
    end    
end
