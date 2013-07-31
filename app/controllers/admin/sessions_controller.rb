class Admin::SessionsController < AdminController
	skip_before_filter :require_login, :only => [:new, :create]

	# login
  def new
  	render layout: "login_layout"
  end

  # redirect to admin home page
  def create
	  user = AdminUser.authenticate(params[:email], params[:password])
	  logger.info 'session#create creating session'
	  if user
	  	logger.info 'session#create user authenticated'
	    session[:user_id] = user.id
	    redirect_to admin_category_index_path
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new", layout: "login_layout"
	  end
	end

	# redirect to login
	def destroy
	  session[:user_id] = nil
	  render "sessions/new", layout: "login_layout"
	end
end
