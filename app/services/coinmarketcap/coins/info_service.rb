module Coinmarketcap
  module Coins
    class InfoService < Coinmarketcap::GetterBaseService
      def request
        self.class.get('/v1/cryptocurrency/info', base_uri: base_uri, headers: headers,
                                                  query: @params)
      end
    end
  end
end
