# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  project = GoodData.use('project_pid')
  cloned_project = project.clone(title: 'New title',
                                 auth_token: 'token',
                                 users: false,
                                 data: true)
end