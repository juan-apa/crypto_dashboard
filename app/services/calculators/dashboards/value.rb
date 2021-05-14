module Calculators
  module Dashboards
    class Value < Base
      def initialize(dashboard)
        super(dashboard)
      end
      
      def call
        coin_values
      end
  
      private
  
      def exchanges
        Coinmarketcap::Coins::Exchange.call(dashboard.coins, user_default_coin).map do |coin_info|
          {
            coin_id: Coin.find_by(symbol: coin_info[:symbol]).id,
            exchange: coin_info[:exchanges][0][:exchange]
          }
        end
      end
  
      def coin_values
        exchanges.map do |coin_info|
          coin = Coin.find(coin_info[:coin_id])
          current_coin_amount = Spent.call(dashboard, coin)
          current_value = current_coin_amount * coin_info[:exchange]
  
          {
            coin_id: coin.id,
            current_coin_amount: current_coin_amount,
            current_value: current_value
          }
        end
      end
  
      def transactions
        @transactions ||= dashboard.transactions
      end
    end
  end
end
