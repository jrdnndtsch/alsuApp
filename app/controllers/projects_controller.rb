class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :upvote]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if current_user.present?
      if current_user.is_admin?
        @projects = Project.all
      else
        @projects = Project.where(user_id: current_user.id)
      end   
    end
  end

  def upvote
    @project = Project.where(id: params[:project_id]).first
    if current_user.present?
      @project.upvote_by current_user
    else
      random = SecureRandom.hex(10)
      voter = VotingSession.find_or_create_by(voter_code: random)
      @project.upvote_by voter
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @project.get_upvotes.size } }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

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
      params.require(:project).permit(:name, :slogan, :description, :approved, :user_id)
    end
end
