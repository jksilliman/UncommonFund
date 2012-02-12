class SiteContent < ActiveRecord::Base
  def self.get(name)
    SiteContent.find_by_name(name).try(:text) || ""
  end
end
