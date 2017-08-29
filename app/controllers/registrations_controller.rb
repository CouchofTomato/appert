class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit( :first_name, :last_name, :email, 
                                  :password, :password_confirmation )
  end

  def account_update_params
    if current_user && current_user.admin?
      params.require(:user).permit( :first_name, :last_name, :email, :company, 
                                    :admin, :analyst, :password, 
                                    :password_confirmation, :current_password )
    else
      params.require(:user).permit( :first_name, :last_name, :email, :password, 
                                    :password_confirmation, :current_password )
    end
  end
end