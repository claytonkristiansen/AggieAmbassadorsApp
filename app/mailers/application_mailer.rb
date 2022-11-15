# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
    default from: ENV["email_username"]
    layout 'mailer'
end
