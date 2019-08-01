class ApplicationController < ActionController::Base
  helper_method :current_user #login情報をどこでも簡単に呼び出せるように
  before_action :login_required  #current_userが空の場合login_pathへリダイレクトする


  def current_user #現在のUSER
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required #current_userが空の場合login_pathへリダイレクトする
    redirect_to login_path unless current_user
  end
end
