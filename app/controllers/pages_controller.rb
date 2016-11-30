class PagesController < ApplicationController
	def all_projects
		@projects = Project.where(approved: true)
	end
end
