class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :from_coin, null: false
      t.references :to_coin, null: false
      t.belongs_to :dashboard

      t.decimal :from_amount, precision: 30, scale: 10, null: false
      t.decimal :to_amount, precision: 30, scale: 10, null: false

      t.timestamps
    end

    add_foreign_key :transactions, :coins, column: :from_coin_id, primary_key: :id
    add_foreign_key :transactions, :coins, column: :to_coin_id,   primary_key: :id
  end
end
