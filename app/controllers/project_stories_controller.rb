class ProjectStoriesController < ApplicationController
  before_action :set_project_story, only: [:show, :edit, :update, :destroy, :sort]

  # GET /project_stories
  # GET /project_stories.json
  def index
    @project_stories = ProjectStory.all
  end

  def sort
    # raise 'hell'
    @project_story.attributes = params.require(:project_story).permit(:row_order_position)
    @project_story.save
    # this action will be called via ajax
    render nothing: true

  end

  # GET /project_stories/1
  # GET /project_stories/1.json
  def show
  end

  # GET /project_stories/new
  def new
    @project_story = ProjectStory.new
  end

  # GET /project_stories/1/edit
  def edit
  end

  # POST /project_stories
  # POST /project_stories.json
  def create
    @project_story = ProjectStory.new(project_story_params)

    respond_to do |format|
      if @project_story.save
        format.html { redirect_to @project_story, notice: 'Project story was successfully created.' }
        format.json { render :show, status: :created, location: @project_story }
      else
        format.html { render :new }
        format.json { render json: @project_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_stories/1
  # PATCH/PUT /project_stories/1.json
  def update
    respond_to do |format|
      if @project_story.update(project_story_params)
        format.html { redirect_to @project_story, notice: 'Project story was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_story }
      else
        format.html { render :edit }
        format.json { render json: @project_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_stories/1
  # DELETE /project_stories/1.json
  def destroy
    @project_story.destroy
    respond_to do |format|
      format.html { redirect_to project_stories_url, notice: 'Project story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_story
      @project_story = ProjectStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_story_params
      params.require(:project_story).permit(:media_type, :description, :video_link, :project_id, :img)
    end
end
