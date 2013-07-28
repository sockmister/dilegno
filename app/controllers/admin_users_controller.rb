class AdminUsersController < ApplicationController
  def new
  	@admin_user = AdminUser.new
  end

  def create
  end
end
