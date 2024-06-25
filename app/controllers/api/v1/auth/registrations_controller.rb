class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private
  def sign_up_params
    params.require(:registration).permit(:name, :user_name, :email, :password, :password_confirmation, :phone, :birthdate)
  end
end
