class Admin::UsersController < AdminController
	def index
		@users = User.where(:is_subscribed => "true").order('created_at')
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :action => 'index'
	end
end
