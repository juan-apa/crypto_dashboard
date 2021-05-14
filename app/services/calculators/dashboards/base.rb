module Calculators
  module Dashboards
    class Base < ApplicationService
      attr_reader :dashboard

      def initialize(dashboard)
        @dashboard = dashboard
      end

      protected

      def user_default_coin
        dashboard.user.default_coin
      end
    end
  end
end
