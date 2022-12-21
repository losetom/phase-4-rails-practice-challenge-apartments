class TenantsController < ApplicationController
    # GET /tenants
    def index
        tenant = Tenant.all
        render json: tenant
    end

    # POST /tenants/new
    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    # UPDATE /tenants/edit
    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update
            render json: tenant, status: :ok
        else
            render json: { errors: "Tenant not found" }, status: :not_found
        end
    end

    # DELETE /tenants/:id
    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: { errors: "Tenant not found" }, status: :not_found
        end
    end

    # SHOW /tenants/:id
    def show
        tenant = Tenant.find_by(id: params[:id])
        render json: tenant, status: :ok
    end
end
