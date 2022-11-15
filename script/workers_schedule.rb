require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    if job.eql?('daily')
      MemberMailer.event_reminder_email.deliver_later
    end
    if job.eql?('monthly')
      MemberMailer.event_requirement_email.deliver_later
    end
  end

  every(1.day, 'daily')
  every(1.month, 'monthly', :if => lambda { |t| t.day == 15 })
end