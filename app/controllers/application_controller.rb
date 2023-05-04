class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  #before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :icon ,:remove_icon]) # 情報更新時にnameの取得を許可
    end



    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
  end
