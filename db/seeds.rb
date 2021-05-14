doge = Coin.create!(symbol: 'DOGE', slug: 'dogecoin', name: 'Dogecoin')
eth  = Coin.create!(symbol: 'ETH', slug: 'ethereum', name: 'Ethereum')
usdt = Coin.create!(symbol: 'USDT', slug: 'tether', name: 'True USD')

juan = User.create!(first_name: 'Juan', last_name: 'Aparicio', email: 'apariciojuan30@gmail.com',
             password: 'password', password_confirmation: 'password', default_coin: usdt)
emi  = User.create!(first_name: 'Emiliano', last_name: 'Fernandez', email: 'aemilianofernandez@gmail.com',
              password: 'password', password_confirmation: 'password', default_coin: usdt)

juan.dashboards.create!(name: 'Default Dashboard', default: true)
emi.dashboards.create!(name: 'Emi\'s Dashboard', default: true)


juan_transactions = juan.dashboards.first.transactions
emi_transactions  = emi.dashboards.first.transactions
juan_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 100, to_amount: 238.48786665)
juan_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 119.16048481)
juan_transactions.create!(from_coin_id: doge.id, to_coin_id: eth.id, from_amount: 200, to_amount: 0.021664248344320886)
juan_transactions.create!(from_coin_id: doge.id, to_coin_id: eth.id, from_amount: 57,  to_amount: 0.007500713975076821)
juan_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 45, to_amount: 102.48327919)
juan_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 92.335448015)


emi_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 100, to_amount: 178.31875738)
emi_transactions.create!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 92.335448015)
