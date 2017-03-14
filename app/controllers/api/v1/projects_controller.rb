module Api
  module V1
    class ProjectsController < Api::BaseController
    	def index
    		@projects = Project.where(approved: true)
    		render json: @projects, include: :category
    	end
    end
  end
end