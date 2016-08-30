class ContactUsController < ApplicationController
  def create
    user = {}
    user['name'] = params[:name]
    user['email'] = params[:email]
    body = params[:body]
    ContactUsNotifier.contact_us(user, body).deliver_now
    render :nothing => true
  end
end
