module Api
  module V1
    class ProjectsController < Api::BaseController
    	def index
    		@projects = Project.where(approved: true)
    		render json: @projects
    	end
    end
  end
end