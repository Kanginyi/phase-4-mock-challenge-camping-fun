class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers.to_json(only: [:id, :name, :age])
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper == nil
            render json: { "error": "Camper not found" }, status: :unprocessable_entity
        else
            render json: camper, status: :ok
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper.to_json(only: [:id, :name, :age]), status: :created
        else
            render json: { errors: camper.errors }, status: :unprocessable_entity
        end
    end

    private
    def camper_params
        params.permit(:name, :age)
    end
end
