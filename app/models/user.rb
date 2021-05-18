class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :dashboards
  belongs_to :default_coin, class_name: "Coin", foreign_key: "default_coin_id"

  def default_dashboard
    dashboards.find_by(default: true)
  end
end
