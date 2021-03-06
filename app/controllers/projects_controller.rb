class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :upvote]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if current_user.present?
      if current_user.is_admin?
        @projects = Project.all
        @projects_approved = Project.submitted_and_approved
        @projects_pending = Project.submitted_and_pending
      else
        @projects = Project.where(user_id: current_user.id)
      end   
    end
  end

  def upvote
    @project = Project.where(id: params[:project_id]).first
    # create random hex for voter code
    random = SecureRandom.hex(10)
    # id of project being voted on
    id = @project.id.to_s
    # key for setting the cookie
    key = 'up8xgf7v' + id 

    if current_user.present?
      # if the user is logged
      if current_user.voted_for? @project
        # has already voted for the project
        @notice = 'you have already voted'
      else
        # has not yet voted, let them vote and set cookie
        @project.upvote_by current_user
        @notice = 'thanks for voting'
        cookies.permanent[key] = @project.id
      end  
    else
      # user is not logged in
      if cookies[key].present? 
          # cookie for current project present 
          @notice = 'you have already voted'
      else
        # no cookie for current project, create a new anonymous voter send vote and set cookie
        voter = VotingSession.find_or_create_by(voter_code: random)
        @project.upvote_by voter
        cookies.permanent[key] = @project.id
        @notice = 'thanks for voting'

      end
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @project.get_upvotes.size, notice: @notice } }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #rank project story blocks by row order 
    @project_stories = Project.find(@project).project_stories.rank(:row_order)
  end

  def publish
    project = Project.find(params[:project_id])
    project.published = true
    project.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { published: project.published } }
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    if params[:project].present?
      project = Project.find(params[:project])
      project.update(approved: params[:approved])
      project.save
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    if params[:project][:category_list].present?
      @project.category_list = []
      params[:project][:category_list].each do |cat|
        @project.category_list.add(cat)
      end  
    end
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if params[:project][:category_list].present?
      @project.category_list = []
      params[:project][:category_list].each do |cat|
        @project.category_list.add(cat)
      end  
    end
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :slogan, :description, :approved, :user_id, :featured_img, :published, :objective, :outcome, :budget, :category_list, project_stories_attributes: [:id, :media_type, :video_link, :description, :img, :project_id])
    end
end
