class HomeController < ApplicationController
skip_before_action :login_required , only: [:about]
  def new; end
  def about; end
end
