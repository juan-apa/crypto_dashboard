class Transaction < ApplicationRecord
  belongs_to :dashboard
  has_one :from_coin, class_name: "Coin", foreign_key: "from_coin_id"
  has_one :to_coin,   class_name: "Coin", foreign_key: "to_coin_id"
end
