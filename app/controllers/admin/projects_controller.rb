class Admin::ProjectsController < Admin::BaseController
  def index
    @projects = Project.includes(:owner)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def create
    @project = Project.new(params[:project], :as => :admin)
    @project.save
    respond_with(@project, :location => admin_projects_path)
  end

  def edit
    respond_with(@project)
  end

  def update
    @project.assign_attributes(params[:project], :as => :admin)
    @project.save
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
