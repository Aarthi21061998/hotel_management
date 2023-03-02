class ApplicationController < ActionController::API
  def generate
        token = Session.find_by(token: params[:token])
        if token.nil?
          render json: { error: 'Not Authorized' }, status: 401 
        elsif token.expire_at < Time.now
           render json: { error: 'Session expired', expire_at: token.expire_at }, status: 401
        end
    end  
end
