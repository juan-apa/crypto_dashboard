doge = Coin.find_or_create_by!(symbol: 'DOGE', slug: 'dogecoin', name: 'Dogecoin')
eth  = Coin.find_or_create_by!(symbol: 'ETH', slug: 'ethereum', name: 'Ethereum')
usdt = Coin.find_or_create_by!(symbol: 'USDT', slug: 'tether', name: 'True USD')

juan = User.find_by!(email: 'apariciojuan30@gmail.com') || User.create!(first_name: 'Juan', last_name: 'Aparicio', email: 'apariciojuan30@gmail.com',
    password: 'password', password_confirmation: 'password', default_coin: usdt)
emi  = User.find_by!(email: 'aemilianofernandez@gmail.com') || User.find_or_create_by!(first_name: 'Emiliano', last_name: 'Fernandez', email: 'aemilianofernandez@gmail.com',
              password: 'password', password_confirmation: 'password', default_coin: usdt)

juan.dashboards.find_or_create_by!(name: 'Default Dashboard', default: true)
emi.dashboards.find_or_create_by!(name: 'Emi\'s Dashboard', default: true)


juan_transactions = juan.dashboards.first.transactions
emi_transactions  = emi.dashboards.first.transactions
juan_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 100, to_amount: 238.48786665)
juan_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 119.16048481)
juan_transactions.find_or_create_by!(from_coin_id: doge.id, to_coin_id: eth.id, from_amount: 200, to_amount: 0.021664248344320886)
juan_transactions.find_or_create_by!(from_coin_id: doge.id, to_coin_id: eth.id, from_amount: 57,  to_amount: 0.007500713975076821)
juan_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 45, to_amount: 102.48327919)
juan_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 92.335448015)


emi_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 100, to_amount: 178.31875738)
emi_transactions.find_or_create_by!(from_coin_id: usdt.id, to_coin_id: doge.id, from_amount: 50, to_amount: 92.335448015)
