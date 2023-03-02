class SessionController < ApplicationController
    def create
        token = Session.create(
        token: SecureRandom.hex(16), expire_at: Time.now + 3.hours)
        render json: token, status: :created
    end
end
