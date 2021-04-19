const { environment } = require('@rails/webpacker')

const appworkConfig = require('./appwork')
environment.config.merge(appworkConfig)

module.exports = environment
