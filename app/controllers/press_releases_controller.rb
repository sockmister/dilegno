class PressReleasesController < ApplicationController
	def index
		@press = PressRelease.order('created_at')
	end
end
