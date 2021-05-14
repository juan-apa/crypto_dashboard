module Calculators
  module Dashboards
    class Information < Base
      def initialize(dashboard)
        super(dashboard)
      end

      def call
        {
          default_coin_spent: default_coin_spent,
          diversification: diversification,
          coins: dashboard_coins
        }
      end

      private

      def diversification
        dashboard_coins.map do |value|
          percentage =  value[:current_value] / dashboard_value

          {
            coin_id: value[:coin_id],
            percentage: percentage
          }
        end
      end

      def dashboard_coins
        @dashboard_coins ||= Value.call(dashboard)
      end

      def dashboard_value
        dashboard_coins.inject(0) { |sum, coin| sum + coin[:current_value] }
      end

      def default_coin_spent
        - Spent.call(dashboard, user_default_coin)
      end
    end
  end
end
