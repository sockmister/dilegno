class Admin::AdministrativeUserController < AdminController
	def edit
	end

	def update
		user = AdminUser.find(session[:user_id])
		if AdminUser.authenticate(user.email, params[:curr_password]) != nil
			if params[:new_password] == params[:confirm_password]
				user.password = params[:new_password]
				user.save
				flash.now.alert = "Password succesfully changed."
			else
				flash.now.alert = "Passwords don't match."
			end
		else
			flash.now.alert = "Wrong password."
		end

		render 'edit'
	end
end
