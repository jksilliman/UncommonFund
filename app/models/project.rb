class Project < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :category
  belongs_to :owner, :class_name => "User"

  attr_accessible :category_id, :name, :owner_name, :video_url, :description, :as => :admin
  attr_accessible :category_id, :name, :video_url, :description, :as => :owner
  
  
  def owner_name
    @owner_name || self.owner.try(:username)
  end

  def owner_name=(name)
    @owner_name = name
  end
  validate :owner_exists
  def owner_exists
    own = User.find_by_username(self.owner_name)
    if own
      self.owner = own
    else
      own = User.new(:username => self.owner_name)
      if own.valid?
        own.save
        self.owner_id = own.id
      else
        self.errors.add(:owner_name, "This is not a valid CNetID")
      end
    end
  end


  def like(user)
    unless self.votes.find_by_user_id(user.id)
      self.votes.create(:user_id => user.id)
    end
  end

  def unlike(user)
    vote = self.votes.find_by_user_id(user.id)
    vote.try(:destroy)
  end

  before_validation :update_html
  def update_html
    if self.video_url_changed? && !self.video_url.blank?
      begin
        embedly_api = Embedly::API.new :key => 'a17e8c0e422511e1bf084040d3dc5c07',
                :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; jksilliman@gmail.com)'
        obj = embedly_api.oembed :url => self.video_url
        self.video_html = obj.first.html
      rescue Exception => e
        errors.add(:video_url, "Error embedding url: #{e}")
      end
    end
  end
end
