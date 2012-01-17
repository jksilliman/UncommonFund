class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable, :omniauthable, :registerable, :validatable, :recoverable

  devise :ldap_authenticatable, :rememberable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password 
  attr_accessible :username, :is_admin, :as => :admin
  attr_accessible :first_name, :last_name, :phone_number, :as => :applicant

  validate :is_in_ldap
  def is_in_ldap
    unless Devise::LdapAdapter.get_ldap_param(self.username,"uid")
      errors.add(:username, "is not a valid CNetID")
    end
  end

  before_save :get_ldap_email
  def get_ldap_email 
    self.email = unwrap(Devise::LdapAdapter.get_ldap_param(self.username,"mail"))
  end

  def name
    unless self.first_name.blank? and self.last_name.blank? 
      self.first_name + " " + self.last_name
    else
      self.username
    end
  end


  private
  def unwrap(arr)
    (arr.kind_of?(Array)) ? arr.first : arr
  end


end
