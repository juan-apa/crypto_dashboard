class Coin < ApplicationRecord
  validates :symbol, uniqueness: true
  has_many :users, inverse_of: :default_coin,
                   foreign_key: :default_coin_id
  has_many :transaction_sources, inverse_of: :from_coin,
                                 foreign_key: :from_coin_id,
                                 class_name: 'Transaction'
  has_many :transaction_destintations, inverse_of: :to_coin,
                                       foreign_key: :to_coin_id,
                                       class_name: 'Transaction'
end
