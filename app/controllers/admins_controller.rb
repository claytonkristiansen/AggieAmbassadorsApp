class AdminsController < ApplicationController
    skip_before_action :authenticate_admin!, only: %i[new create]
    before_action :set_admin, only: %i[show edit update destroy]

    # GET /admins or /admins.json
    def index
        # if (!admin_is_owner_omniauth_authorize_path)
        #     redirect_to(new_admin_session_path, notice: "#{auth.info.email} is not authorized.")
        # end
        @admins = Admin.all
    end

    # GET /admins/1 or /admins/1.json
    def show; end

    # GET /create_new_user
    def new
        @admin = Admin.new
    end

    # GET /admins/1/edit
    def edit; end

    # POST /admins or /admins.json
    def create
        @admin = Admin.new(admin_params_new)
        @admin.privilege_level = 10
        @admin.position_title = "Member"

        respond_to do |format|
            if @admin.save
                format.html do
                    redirect_to(new_admin_session_path, notice: 'Admin was successfully created.')
                end
                format.json {  }
            else
                format.html { render(:new, status: :unprocessable_entity) }
                format.json { render(json: @admin.errors, status: :unprocessable_entity) }
            end
        end
    end

    # PATCH/PUT /admins/1 or /admins/1.json
    def update
        respond_to do |format|
            if @admin.update(admin_params_edit)
                format.html do
                    redirect_to(admins_url, notice: 'Admin was successfully updated.')
                end
                format.json { }
            else
                format.html { render(:edit, status: :unprocessable_entity) }
                format.json { render(json: @admin.errors, status: :unprocessable_entity) }
            end
        end
    end

    # DELETE /admins/1 or /admins/1.json
    def delete
        @admin = Admin.find(params[:id])
    end

    def destroy
        @admin = Admin.find(params[:id])
        @admin.destroy!

        respond_to do |format|
            format.html { redirect_to(admins_url, notice: 'Admin was successfully destroyed.') }
            format.json { head(:no_content) }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin
        @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params_new
        params.require(:admin).permit(:email, :preferred_name, :send_emails)
    end

    def admin_params_edit
        params.require(:admin).permit(:position_title, :privilege_level)
    end
end