module Coinmarketcap
  class GetterBaseService < Coinmarketcap::BaseService
    attr_reader :params

    def initialize(params)
      super()
      @params = params
    end
  end
end
