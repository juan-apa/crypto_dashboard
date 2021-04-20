module Coinmarketcap
  module Coins
    class InfoService < Coinmarketcap::GetterBaseService
      def initialize(params)
        super(sanitize_params(params))
      end

      def request
        self.class.get('/v1/cryptocurrency/info', base_uri: base_uri, headers: headers,
                                                  query: @params)
      end

      private

      def sanitize_params(params)
        params[:symbol] = params[:symbol].upcase unless params[:symbol].nil?
        params[:slug] = params[:slug].downcase unless params[:slug].nil?
        params
      end
    end
  end
end
