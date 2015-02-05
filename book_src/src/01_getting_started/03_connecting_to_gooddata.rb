# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
    # just so you believe us we are printing names of all the project under this account
    client.projects.each do |project|
        puts project.title
    end
end