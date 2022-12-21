class LeasesController < ApplicationController
    def create
        lease = Lease.create(params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent)
    end
end
