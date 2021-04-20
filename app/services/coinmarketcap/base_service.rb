module Coinmarketcap
  class BaseService < ApplicationService
    include HTTParty

    def call
      JSON.parse(request.body)
    end

    protected

    def base_uri
      'https://pro-api.coinmarketcap.com'
    end

    def headers
      {
        'X-CMC_PRO_API_KEY': ENV.fetch('COINMARKETCAP_API_KEY'),
        'Accept': 'application/json'
      }
    end
  end
end
