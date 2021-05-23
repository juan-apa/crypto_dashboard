class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :service_worker
  skip_before_action :verify_authenticity_token, only: :service_worker

  helper_method :dashboard


  def index
    @title = 'Dashboard'
    @data = dashboard_data
  end

  def edit
    dashboard.update(dashboard_params)
  end

  def service_worker
    render 'service_worker', layout: false
  end

  private

  def default_dashboard
    current_user.default_dashboard
  end

  def dashboard
    @dashboard ||= if params[:id].present?
      current_user.dashboards.find(params[:id])
    else
      default_dashboard
    end
  end

  def dashboard_data
    @dashboard_data ||= Calculators::Dashboards::Information.call(dashboard)
  end

  def dashboard_params
    params.require(:dashboard).permit(:name, :default)
  end
end
