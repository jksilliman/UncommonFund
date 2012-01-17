class Admin::NominationsController < Admin::BaseController
  def index
    @committee = Committee.find(params[:committee_id])
    @application = @committee.applications.find_by_applicant_id(params[:nominee_id])
    @nominations = @committee.nominations.find_all_by_nominee_id(params[:nominee_id])
  
    @nominee = User.find(params[:nominee_id])

    render :index
  end
end
