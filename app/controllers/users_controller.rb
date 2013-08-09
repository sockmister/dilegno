require 'mail'

class UsersController < ApplicationController
	def contact_us
		if params[:comments] == ""
			logger.info 'not spam'
			UserMailer.contact_us(params[:email], params[:subject], params[:message]).deliver
			unless User.where(:email => params[:email]).first
				User.create(:email => params[:email], :is_subscribed => false)
			end
		end
		render 'thanks_contact'
	end

	def newsletter
		if params[:comments] == ""
			unless User.where(:email => params[:email]).first
				User.create(:email => params[:email], :is_subscribed => true)
			end
		end
		render 'thanks_newsletter'
	end
end
