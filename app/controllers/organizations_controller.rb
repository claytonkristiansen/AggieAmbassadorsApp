# frozen_string_literal: true

class OrganizationsController < ApplicationController
    skip_before_action :authenticate_admin!, only: %i[index show]
    before_action :set_organization, only: %i[show edit update destroy]

    # GET /organizations or /organizations.json
    def index
        @organizations = Organization.all
    end

    # GET /organizations/1 or /organizations/1.json
    def show; end

    # GET /organizations/new
    def new
        @organization = Organization.new
    end

    # GET /organizations/1/edit
    def edit; end

    # POST /organizations or /organizations.json
    def create
        @organization = Organization.new(organization_params)

        respond_to do |format|
            if @organization.save
                format.html do
                    redirect_to(organization_url(@organization),
                                notice: 'Organization was successfully created.'
                               )
                end
                format.json { render(:show, status: :created, location: @organization) }
            else
                format.html { render(:new, status: :unprocessable_entity) }
                format.json { render(json: @organization.errors, status: :unprocessable_entity) }
            end
        end
    end

    # PATCH/PUT /organizations/1 or /organizations/1.json
    def update
        respond_to do |format|
            if @organization.update(organization_params)
                format.html do
                    redirect_to(organization_url(@organization),
                                notice: 'Organization was successfully updated.'
                               )
                end
                format.json { render(:show, status: :ok, location: @organization) }
            else
                format.html { render(:edit, status: :unprocessable_entity) }
                format.json { render(json: @organization.errors, status: :unprocessable_entity) }
            end
        end
    end

    # DELETE /organizations/1 or /organizations/1.json
    def delete
        @organization = Organization.find(params[:id])
    end

    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy!

        respond_to do |format|
            format.html do
                redirect_to(organizations_url, notice: 'Organization was successfully destroyed.')
            end
            format.json { head(:no_content) }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_organization
        @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
        params.require(:organization).permit(:name, :contact_name, :contact_email, :contact_phone,
                                             :contact_title
        )
    end
end
