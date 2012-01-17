class CommitteesController < ApplicationController
  
  def index
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @committees =  Committee.find_all_by_section_id(params[:section_id])
    else
      @section = Section.new(name: "Other")
      @committees = Committee.find_all_by_section_id(nil)      
    end
  end
  def show
    @committee = Committee.find(params[:id])
  end

end
