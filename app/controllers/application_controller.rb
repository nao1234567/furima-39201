class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana,
                                             :birth_day])
  end
end

# Basic認証によるログインの要求は、すべてのコントローラーで行い。そのため、Basic認証の処理をapplication_controller.rbのprivate以下にメソッドとして定義し、before_actionで呼び出している。どのページにアクセスしてもBasic認証が要求されるようになった。
