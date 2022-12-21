class ApartmentsController < ApplicationController
    def index
        apartment = Apartment.all
        render json: apartment
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment, status: :found
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    def create
        apartment = Apartment.create(params)
        render json: apartment, status: :created
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    private 

    def apartment_params
        params.permit(:number)
    end
end
