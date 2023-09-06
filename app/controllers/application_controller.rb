class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end

# Basic認証によるログインの要求は、すべてのコントローラーで行い。そのため、Basic認証の処理をapplication_controller.rbのprivate以下にメソッドとして定義し、before_actionで呼び出している。どのページにアクセスしてもBasic認証が要求されるようになった。