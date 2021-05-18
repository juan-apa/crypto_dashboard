class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'main/layout-2'
end
