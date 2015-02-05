# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  project = client.projects('project_pid')
  pp project.users
end