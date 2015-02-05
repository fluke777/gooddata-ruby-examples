# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  project = GoodData.use('project_pid')
  puts project.title
end
