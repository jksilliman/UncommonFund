class NominationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_nomination, :only => [:create]
  load_and_authorize_resource
  
  respond_to :html
  

  def new
    @committee = Committee.find(params[:committee_id])
    @nomination.committee_id = @committee.id
    @nomination.nominator = current_user # ?
    respond_with(@nomination) 
  end

  def create
    @committee = @nomination.committee
    if @nomination.save
      #NominationMailer.nomination_confirmation(current_user, @nomination.nominee, @committee)
      NominationMailer.nomination_notification(@nomination.nominee, @committee).deliver
    end
    respond_with(@nomination, :location => root_url)
  end

  private
  def load_nomination
    @nomination = Nomination.new
    @nomination.nominator = current_user
    @nomination.committee_id = params[:nomination][:committee_id]
    @nomination.assign_attributes(params[:nomination])
  end
end
