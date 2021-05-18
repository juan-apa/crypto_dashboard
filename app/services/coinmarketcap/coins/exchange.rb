module Coinmarketcap
  module Coins
    class Exchange < Coinmarketcap::GetterBaseService
      attr_reader :coins, :exchange_coins

      ENDPOINT = '/v1/cryptocurrency/quotes/latest'

      def call
        convert_result(super())
      end

      def initialize(coins, exchange_coins = default_coin)
        @coins = coins
        @exchange_coins = exchange_coins
        super(build_params)
      end

      def request
        Rails.cache.fetch([ENDPOINT, @params], expires: 1.minute) do
          self.class.get(ENDPOINT, base_uri: base_uri,
            headers: headers,
            query: @params)
        end
      end

      private

      def symbol
        Array(coins).pluck(:symbol).join(',')
      end

      def convert
        Array(exchange_coins).pluck(:symbol).join(',')
      end

      def build_params
        {
          symbol: symbol,
          convert: convert
        }
      end

      def convert_result(result)
        result['data'].keys.map do |coin_symbol|
          quote = result['data'][coin_symbol]['quote']
          {
            symbol: coin_symbol,
            exchanges: parse_exchanges(quote)
          }
        end
      end

      def parse_exchanges(quote)
        coin_symbols = quote.keys
        coin_symbols.map do |coin_symbol|
          {
            'symbol': coin_symbol,
            'exchange': quote[coin_symbol]['price']
          }
        end
      end
    end
  end
end
