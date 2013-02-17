class ProjectsController < ApplicationController
  before_filter :authenticate_and_redirect!, :only => [:like, :unlike]
  before_filter :load_project, :except => [:index]
  before_filter :authorize_owner!, :only => [:edit, :update]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @projects = Category.projects
    else
      @categories = Category.all
      @projects = Project.all
    end
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def edit
    respond_with(@project)
  end

  def update
    @project.assign_attributes(params[:project], :as => :owner)
    @project.save
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

  def authorize_owner!
    redirect_to root_path unless current_user == @project.owner
  end

end
