# class ApiProjectsController < BaseApiController

# 	def show
# 		@projects = Project.where(approved: true)
# 		render json: @projects
# 	end
# end

module Api
	module V1
		class ApiProjectsController < ApiController 
			def show
				raise 'hell'
				@projects = Project.where(approved: true)
				render json: @projects
			end
		end
	end
end