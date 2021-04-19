class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :service_worker

  def index
    @title = 'Home'
  end

  def service_worker
    render 'service_worker', layout: false
  end
end
