class Admin::BaseController < ApplicationController
  before_filter :authenticate_and_redirect!
  layout 'admin'
  
  protected
  def respond_with(*args, &block)
    super(:admin, *args, &block)
  end
end
