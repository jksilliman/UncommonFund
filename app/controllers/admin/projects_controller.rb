class Admin::ProjectsController < Admin::BaseController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def create
    @project = Project.create(params[:project])
    respond_with(@project, :location => admin_projects_path)
  end

  def edit
    respond_with(@project)
  end

  def update
    @project.update_attributes(params[:project])
    respond_with(@project, :location => admin_projects_path)
  end

  def destroy
    @project.destroy
  end

  private
  before_filter :load_project, :only => [:edit, :update, :destroy]
  def load_project
    @project = Project.find(params[:id])
  end
end
