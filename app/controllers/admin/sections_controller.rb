class Admin::SectionsController < Admin::BaseController 
  load_and_authorize_resource :section
  respond_to :html
  def index
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    respond_with(@section)
  end

  def create
    @section.save
    respond_with(@section, :location => admin_sections_path)
  end

  def edit
    respond_with(@section)
  end

  def update
    @section.update_attributes(params[:section])
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

end
