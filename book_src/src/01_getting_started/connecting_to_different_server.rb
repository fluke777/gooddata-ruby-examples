# encoding: utf-8
require 'gooddata'

GoodData.with_connection(login: 'user',
                         password: 'password',
                         server: 'https://some-other-server.com') do |client|
  # just so you believe us we are printing names of all the project under this account
  client.projects.each do |project|
    puts project.title
  end
end