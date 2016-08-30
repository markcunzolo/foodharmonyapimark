class ContactUsNotifier < ApplicationMailer

  def contact_us(user, body)
    @body = body
    @user = user
    recipients = ['shaun@riversagile.com', 'kevin@riversagile.com', 'louisgarret@comcast.net', 'dburgard@gmail.com', 'carnegie2165@yahoo.com', 'markcunzolo@gmail.com']
    mail( :to => recipients,
          :subject => 'User request' )
  end
end
