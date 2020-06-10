# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  
  before_action :reject_end_user,only: [:create]

  def after_sign_in_path_for(resource)
     end_users_path
  end

  protected
  def reject_end_user
    @end_user = EndUser.find_by(email: params[:end_user][:email].downcase)
    if @end_user
      if (@end_user.valid_password?(params[:end_user][:password]) && 
         (@end_user.active_for_authentication? == false))
          # (current_end_user.active_for_authentication? == false))
          redirect_to new_end_user_session_path,alert:"退会済みです。"
      end
    else
      flash[:alert] = "必要項目を入力してください。"
    end
  end
      
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
