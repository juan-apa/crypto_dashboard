class Coin < ApplicationRecord
  validates :symbol, uniqueness: true
end
