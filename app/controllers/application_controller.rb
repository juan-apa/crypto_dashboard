class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'main/layout-without-navbar'
end
