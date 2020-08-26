class ApplicationController < ActionController::Base
  # before_action :authenticate_user! ログインしていないユーザーをサインアップの画面に
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :encrypted_password, :firstname, :lastname,
                                             :firstname_kana, :lastname_kana, :birthday])
  end
end
