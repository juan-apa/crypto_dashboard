class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :dashboards
  belongs_to :default_coin, class_name: "Coin", foreign_key: "default_coin_id"
  before_validation :set_default_coin
  after_create :create_default_dashboard

  def default_dashboard
    dashboards.find_by(default: true)
  end

  private

  def set_default_coin
    self.default_coin ||= Coin.find_by(symbol: 'USDT')
  end

  def create_default_dashboard
    dashboards.create!(name: 'Default Dashboard')
  end
end
