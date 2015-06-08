# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_pid')

# this will print their representations
pp project.users

# You might want to see just name and login
pp project.users.map {|u| [u.login, u.name]}