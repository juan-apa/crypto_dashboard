module Calculators
  module Dashboards
    class Spent < Base
      attr_reader :coin

      def initialize(dashboard, coin)
        super(dashboard)
        @coin = coin
      end
  
      def call
        total_spent
      end
  
      private
  
      def total_spent
        transactions.inject(0) { |sum, transaction| sum + transaction.delta_transaction(coin) }
      end
  
      def transactions
        dashboard.transactions
      end
    end
  end
end
