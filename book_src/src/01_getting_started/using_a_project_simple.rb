# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  GoodData.with_project('project_pid') do |project|
    puts project.title
  end
end