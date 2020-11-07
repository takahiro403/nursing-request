class ApplicationController < ActionController::Base
  # ポートフォリオ用のためbasic認証は無効
  # before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

 # 各アクションで権限をチェック
  authorize_resource :class => false

  # 権限が無いページへアクセス時の例外処理
  rescue_from CanCan::AccessDenied do |exception|
    # root_urlに飛ばす
    redirect_to exclusions_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  end

  private

  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
      #username == Rails.application.credentials[:basic][:BASIC_AUTH_USER] && password == Rails.application.credentials[:basic][:BASIC_AUTH_PASSWORD]
    #end
  #end
end
