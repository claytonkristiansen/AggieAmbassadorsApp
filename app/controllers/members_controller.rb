class MembersController < ApplicationController
    skip_before_action :authenticate_member!, only: %i[new create]
    before_action :set_member, only: %i[show edit update destroy]

    # GET /members or /members.json
    def index
        redirect_to(new_member_session_path, notice: 'You are not authorized.') unless is_owner?
        @members = Member.all
    end

    # GET /members/1 or /members/1.json
    def show
        @member = Member.find(params[:id])
    end

    # GET /create_new_user
    def new
        @member = Member.new
    end

    # GET /members/1/edit
    def edit; end

    # POST /members or /members.json
    def create
        @member = Member.new(member_params_new)
        @member.privilege_level = 10
        @member.position_title = 'Member'

        respond_to do |format|
            if @member.save
                MemberMailer.with(member: @member).welcome_email.deliver_later if @member.send_emails
                format.html do
                    redirect_to(new_member_session_path, notice: 'Member was successfully created.')
                end
                format.json {}
            else
                format.html { render(:new, status: :unprocessable_entity) }
                format.json { render(json: @member.errors, status: :unprocessable_entity) }
            end
        end
    end

    # PATCH/PUT /members/1 or /members/1.json
    def update
        respond_to do |format|
            if @member.update(member_params_edit)
                format.html do
                    redirect_to(members_url, notice: 'Member was successfully updated.')
                end
                format.json {}
            else
                format.html { render(:edit, status: :unprocessable_entity) }
                format.json { render(json: @member.errors, status: :unprocessable_entity) }
            end
        end
    end

    # DELETE /members/1 or /members/1.json
    def delete
        @member = Member.find(params[:id])
    end

    def destroy
        @member = Member.find(params[:id])
        @member.destroy!

        respond_to do |format|
            format.html { redirect_to(members_url, notice: 'Member was successfully destroyed.') }
            format.json { head(:no_content) }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_member
        @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params_new
        params.require(:member).permit(:email, :preferred_name, :send_emails)
    end

    def member_params_edit
        params.require(:member).permit(:position_title, :privilege_level, :preferred_name, :send_emails)
    end
end
