module Questionable
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    # type - applicant | nominator
    def has_questions_for(question_type)
      
      #has_many :questions, :autosave => false
      validates_associated :questions
      #accepts_nested_attributes_for :questions
      attr_accessible :questions_attributes
      before_save :serialize_answers

      include InstanceMethods

      define_method "questions" do
        unless @questions
          @questions = []
          if self.committee.use_default_questions 
            @questions.concat Question.where("for_#{question_type}" => true, :committee_id => nil).to_a
          end
          @questions.concat Question.where(:committee_id => self.committee.id, "for_#{question_type}" => true).to_a
        end
        @questions
      end

      define_method "questions_attributes=" do |qs|
        qs.each do |id, data|
          puts "#{id} : #{data['answer']}"
          self.questions.each do |q|
            if id.to_s == q.id.to_s
              q.answer = data['answer']
              break
            end
          end
        end
      end
    end
  end

  module InstanceMethods
    def serialize_answers
      self.form_data = self.questions.map(&:to_hash).to_json
    end
    def answers
      return [] if self.form_data.blank?
      @answers ||= ActiveSupport::JSON.decode(self.form_data)
    end
  end
end
