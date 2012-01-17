class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:like, :unlike]
  before_filter :load_project, :except => [:index]


  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @projects = Category.projects
    else
      @projects = Project.all
    end
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def like
    @project.like(current_user)
    flash[:success] = "Thank you for voting!"
    redirect_to project_path(@project)
  end

  def unlike
    @project.unlike(current_user)
    flash[:success] = "Thank you for voting!"
    redirect_to project_path(@project)
  end

  private
  def load_project
    @project = Project.find(params[:id])
  end

end
