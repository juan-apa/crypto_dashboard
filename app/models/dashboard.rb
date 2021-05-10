class Dashboard < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :coins, -> { distinct }, through: :transactions

  after_validation :set_default_value, if: :first_dashboard?
  after_commit :set_default, only: %i[create update]
  after_destroy :set_first_default

  def set_default_value
    self.default = true
  end
  
  def first_dashboard?
    (user_dashboards.count || 0).zero?
  end

  def set_default
    user_dashboards.where.not(id: id).update_all(default: false) if default
  end

  def set_first_default
    user_dashboards.first.update_column(default: true)
  end

  private

  def user_dashboards
    Dashboard.where(user_id: user_id)
  end
end
