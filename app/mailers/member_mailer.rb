class MemberMailer < ApplicationMailer
  def welcome_email
    @member = params[:member]
    mail(to: @member.email, subject: 'Welcome To Aggie Ambassadors')
  end

  def event_reminder_email
    future_date = Time.now + 2.days
    events = Event.where(event_date: future_date)
    events.each do |event|
      @event = event
      records = AttendanceRecord.where(event_id: @event.id)
      records.each do |record|
        @member = Member.find(id: record.member_id)
        if @member.send_emails
          mail(to: @member.email, subject: 'Event Coming Up')
        end
      end
    end
  end

  def event_requirement_email
    current_date = Time.now
    puts current_date
    if current_date.month >= 7
      check_date = Time.new(current_date.year, 7, 1)
    else
      check_date = Time.new(current_date.year - 1, 7, 1)
    end
    members = Member.where(send_emails: true)
    members.each do |member|
      @member = member
      if AttendanceRecord.where(member_id: @member.id, attended: true).where("created_at >= ?", check_date ).empty?
        mail(to: @member.email, subject: "Don't Forget To Attend An Event")
      end
    end
  end

end
