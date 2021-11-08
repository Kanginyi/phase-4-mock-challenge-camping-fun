class SignupsController < ApplicationController
    def create
        activity = signup.activity

        signup = Signup.create(signup_params)
        if signup.valid?
            render json: activity, status: :created
        else
            render json: { errors: signup.errors }, status: :unprocessable_entity
        end
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
