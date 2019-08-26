class HomeController < ApplicationController
skip_before_action :login_required , only: [:about]
  def new
    @search_star_messages = current_user.star_messages.order("created_at DESC").ransack(params[:q])
    @star_messages = @search_star_messages.result(distinct: true).page(params[:page]).per(8)
  end
  def about; end
end
