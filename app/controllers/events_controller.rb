class EventsController < ApplicationController
    before_action :set_event, only: %i[show edit update destroy]

    # GET /events or /events.json
    def index
        @events = Event.all
        # Passing list of event ids that the signed in user is registered for
        @attendance_records_registered = AttendanceRecord.where(admin_id: get_id).to_ary.map(&:event_id)
    end

    # GET /events/1 or /events/1.json
    def show; end

    # GET /events/new
    def new
        @event = Event.new
    end

    # GET /events/1/edit
    def edit; end

    # POST /events or /events.json
    def create
        @event = Event.new(event_params)

        respond_to do |format|
            if @event.save
                format.html { redirect_to(event_url(@event), notice: 'Event was successfully created.') }
                format.json { render(:show, status: :created, location: @event) }
            else
                format.html { render(:new, status: :unprocessable_entity) }
                format.json { render(json: @event.errors, status: :unprocessable_entity) }
            end
        end
    end

    # PATCH/PUT /events/1 or /events/1.json
    def update
        respond_to do |format|
            if @event.update(event_params)
                format.html { redirect_to(event_url(@event), notice: 'Event was successfully updated.') }
                format.json { render(:show, status: :ok, location: @event) }
            else
                format.html { render(:edit, status: :unprocessable_entity) }
                format.json { render(json: @event.errors, status: :unprocessable_entity) }
            end
        end
    end

    # DELETE /events/1 or /events/1.json
    def delete
        @event = Event.find(params[:id])
    end

    # Event controller method that actually deletes event item from database
    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        respond_to do |format|
            format.html { redirect_to(events_url, notice: 'Event was successfully destroyed.') }
            format.json { head(:no_content) }
        end
    end

    # GET Event controller method to redirect to the registration confirmation page
    def register_details; end

    # Event controller method for registering to an event (deletes entry from table)
    def register
        if(!AttendanceRecord.where(event_id: params[:id], admin_id: get_id).exists?)
            @attendance_record = AttendanceRecord.new(event_id: params[:id], admin_id: get_id)
            @attendance_record.save
            respond_to do |format|
                format.html { redirect_to(events_url, notice: 'Successfully registered for event.') }
                format.json { head(:no_content) }
            end
        else
            respond_to do |format|
                format.html { redirect_to(events_url, notice: 'Failed to register for event, registration already exists') }
                format.json { head(:no_content) }
            end
        end
    end

    # GET Event controller method to redirect to the unregister confirmation page
    def unregister_details; end

    # Event controller method for unregistering from an event (deletes entry from table)
    def unregister
        @attendance_record = AttendanceRecord.where(event_id: params[:id], admin_id: get_id).destroy_all
        respond_to do |format|
            format.html { redirect_to(events_url, notice: 'Succefully unregistered for event.') }
            format.json { head(:no_content) }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
        @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
        params.require(:event).permit(:title, :event_date, :event_time, :location, :description)
    end
end
