# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  project = GoodData::Project.create(title: 'New project',
                                     template: 'https://secure.gooddata.com/projectTemplates/SuperSoda/1/',
                                     auth_token: 'token')
end