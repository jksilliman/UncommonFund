class Project < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :category

  def like(user)
    unless self.votes.find_by_user_id(user.id)
      self.votes.create(:user_id => user.id)
    end
  end

  def unlike(user)
    vote = self.votes.find_by_user_id(user.id)
    vote.try(:destroy)
  end
end
