class Transaction < ApplicationRecord
  belongs_to :dashboard
  belongs_to :from_coin, class_name: "Coin", foreign_key: "from_coin_id"
  belongs_to :to_coin,   class_name: "Coin", foreign_key: "to_coin_id"

  scope :with_coin, -> (coin) { where(from_coin: coin).or(where(to_coin: coin))}

  def delta_transaction(coin)
    if from_coin_id == coin.id
      -from_amount
    elsif to_coin_id == coin.id
      to_amount
    else
      0
    end
  end

  def exchange_rate(source_coin=to_coin)
    source_coin == to_coin ? to_amount/from_amount : from_amount/to_mount
  end
end
