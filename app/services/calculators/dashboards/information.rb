module Calculators
  module Dashboards
    class Information < Base
      def initialize(dashboard)
        super(dashboard)
      end

      def call
        {
          default_coin: user_default_coin,
          default_coin_spent: default_coin_spent,
          diversification: diversification,
          coins: dashboard_coins,
          coins_count: dashboard_coins.count,
          value: value,
          difference: value - default_coin_spent
        }
      end

      private

      def value
        @value ||= dashboard_coins.inject(0) { |sum, coin_data| sum + coin_data[:current_value] }
      end

      def diversification
        dashboard_coins.map do |value|
          percentage =  (value[:current_value] / dashboard_value) * 100
          {
            coin_id: value[:coin_id],
            coin: value[:coin],
            percentage: percentage.round(2)
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
        @default_coin_spent ||= - Spent.call(dashboard, user_default_coin)
      end
    end
  end
end
