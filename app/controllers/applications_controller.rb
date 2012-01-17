class ApplicationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_already_applied
  before_filter :load_application, :only => [:create]
  load_and_authorize_resource

  respond_to :html

  def new
    @application.committee_id = @committee.id
    @application.applicant = current_user # ?
    respond_with(@application)
  end

  def create
    @committee = @application.committee
    @application.applicant = current_user

    if @application.save
      NominationMailer.application_confirmation(current_user, @committee).deliver
    end
    respond_with(@application, :location => root_url)
  end

  private
  def check_already_applied
    @committee = Committee.find(params[:committee_id] || params[:application][:committee_id])
    if @committee.application_for(current_user)
      flash[:error] = "You have already applied to be on this committee."
      redirect_to committees_path(:section_id => @committee.section_id)
    end
  end

  def load_application
    @application = Application.new
    @application.applicant = current_user
    
    @application.committee_id = params[:application][:committee_id] 
    # The assignment of questions requires the committee already to be assigned,
    
    @application.assign_attributes(params[:application])
  end

end
