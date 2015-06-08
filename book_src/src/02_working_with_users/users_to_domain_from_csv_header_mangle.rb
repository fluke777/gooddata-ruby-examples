# encoding: utf-8

require 'gooddata'

client = GoodData.connect

headers = ["UserLogin", "FirstName", "LastName", "UserPassword"]
new_headers = [:login, :first_name, :last_name, :password]

domain = client.domain('domain-name')
users = []
CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
  new_data = new_headers.zip(row.to_hash.values_at(*headers))
  users << Hash[new_data]
end

domain.create_users(users)
