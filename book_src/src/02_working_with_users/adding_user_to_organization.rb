# encoding: utf-8

require 'gooddata'

client = GoodData.connect

# Get your domain ..
domain = client.domain('domain_name')

# Generate random password
pass = (0...10).map { ('a'..'z').to_a[rand(26)] }.join

new_user = domain.add_user(
  :login => 'new.user@gooddata.com',
  :password => pass,
  :first_name => 'First',
  :last_name => 'Last',
  :email => 'test@gooddata.com',
  :sso_provider => 'some_sso'
)

pp new_user
