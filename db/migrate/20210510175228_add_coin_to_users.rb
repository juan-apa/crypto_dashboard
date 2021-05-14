class AddCoinToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.belongs_to :default_coin, foreign_key: { to_table: :coins }, index: true
    end
  end
end
