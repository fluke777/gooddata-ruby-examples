# encoding: utf-8

require 'gooddata'

# Traditionally with login and pass
client = GoodData.connect(login: 'user', password: 'password', verify_ssl: false)

# You can also use it with SST token
client = GoodData.connect(sst_token: 'sst_token', verify_ssl: false)
