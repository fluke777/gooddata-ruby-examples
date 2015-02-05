# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  GoodData.with_project('project_pid') do |project|
    project.invite('joe@example.com', 'admin', 'Hey Joe, look at this.')
  end
end