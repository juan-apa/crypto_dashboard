module Coinmarketcap
  class GetterBaseService < Coinmarketcap::BaseService
    attr_reader :params

    def initialize(params)
      super()
      @params = sanitize_params(params)
    end

    def sanitize_params(params)
      params[:symbol] = params[:symbol].upcase unless params[:symbol].nil?
      params[:slug] = params[:slug].downcase unless params[:slug].nil?
      params
    end
  end
end
