# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|

  # Get your domain ..
  domain = client.domain('my-domain')

  # Generate random password
  pass = (0...10).map { ('a'..'z').to_a[rand(26)] }.join

  new_user = domain.add_user(
    :login => 'new.user@gooddata.com',
    :password => pass,
    :first_name => 'First',
    :last_name => 'Last',
    :email => 'test@gooddata.com'
  )

  pp new_user
end