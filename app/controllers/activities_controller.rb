class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities.to_json(only: [:id, :name, :difficulty])
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity == nil
            render json: { "error": "Activity not found" }, status: :unprocessable_entity
        else
            activity.signups.destroy
            activity.destroy
            head :no_content
        end
    end
end
