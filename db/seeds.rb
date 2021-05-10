User.create!(first_name: 'Juan', last_name: 'Aparicio', email: 'apariciojuan30@gmail.com',
             password: 'password', password_confirmation: 'password')
User.first.dashboards.create!(name: 'Default Dashboard', default: true)

usd  = Coin.create!(symbol: 'USD', slug: 'usd', name: 'US Dollar')
doge = Coin.create!(symbol: 'DOGE', slug: 'dogecoin', name: 'Dogecoin')
eth  = Coin.create!(symbol: 'ETH', slug: 'ethereum', name: 'Ethereum')

User.first.dashboards.first.transactions.create!(from_coin_id: usd.id, to_coin_id: doge.id, from_amount: 100, to_amount: 238.48786665)
User.first.dashboards.first.transactions.create!(from_coin_id: usd.id, to_coin_id: doge.id, from_amount: 50, to_amount: 119.16048481)
