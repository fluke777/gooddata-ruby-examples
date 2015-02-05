# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  GoodData::Project.create(title: 'This is my new project', auth_token: 'TOKEN')
end