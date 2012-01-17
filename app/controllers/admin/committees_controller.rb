class Admin::CommitteesController < Admin::BaseController  
  load_and_authorize_resource
  def index
    Committee.find(:all, :include => :section, :order => "sections.id DESC")
    respond_with(@committee)
  end

  def new
    respond_with(@committee)
  end

  def create
    @committee = Committee.create(params[:committee])
    respond_with(@committee, :location => admin_committees_path)
  end

  def edit
    respond_with(@committee)
  end

  def update
    @committee.update_attributes(params[:committee])
    respond_with(@committee, :location => admin_committees_path)
  end

  def destroy
    @committee.destroy
    respond_with(@committee)
  end

  def show
    respond_with(@committee)
  end


end
