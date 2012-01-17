class Admin::QuestionsController < Admin::BaseController

  load_and_authorize_resource
  respond_to :html

  def index
    @applicant_questions = Question.find_all_by_for_applicant(true)
    @nominator_questions = Question.find_all_by_for_nominator(true)
  end

  def new
    if params[:for_applicant]
      @question.for_applicant = true
    elsif params[:for_nominator]
      @question.for_nominator = true
    end
    respond_with(@question)
  end

  def create
    @question = Question.new(params[:question])
    @question.save
    respond_with(@question, :location => admin_questions_path)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

end
