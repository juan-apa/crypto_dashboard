class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :dashboards
  belongs_to :default_coin, class_name: "Coin", foreign_key: "default_coin_id"
  before_validation :set_default_coin

  def default_dashboard
    dashboards.find_by(default: true)
  end

  def set_default_coin
    self.default_coin ||= Coin.find_by(symbol: 'USDT')
  end
end
