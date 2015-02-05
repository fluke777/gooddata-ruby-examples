# encoding: utf-8

require 'gooddata'

client = GoodData.connect(login: 'user', password: 'password')
client.connection.sst_token

# Once you have the token, you can try to login and do something.

GoodData.with_connection(sst_token: 'sst_token') do |client|
  client.projects.each do |p|
    puts p.title
  end
end