# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :check_admin

  def check_admin
    redirect_to root_path unless current_user.role == "admin"
  end
end
