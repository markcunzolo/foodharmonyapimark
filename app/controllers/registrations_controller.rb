class RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params

    params.permit(:name, :email, :password, :password_confirmation, :confirmation_success_url)
  end

  def account_update_params
    params.permit(:name, :email, :password, :password_confirmation, :confirmation_success_url)
  end
end