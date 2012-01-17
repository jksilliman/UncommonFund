class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  protected
  def respond_with(*args, &block)
    super(:admin, *args, &block)
  end
end
