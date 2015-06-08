# encoding: utf-8

require 'gooddata'

client = GoodData.connect

project = client.projects('project_pid')
domain = client.domain('domain_name')

users = []
CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
  users << row.to_hash.symbolize_keys
end

domain.create_users(users)
project.import_users(users, domain: domain)