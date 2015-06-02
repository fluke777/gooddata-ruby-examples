# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_pid')
cloned_project = project.clone(title: 'New title',
                               auth_token: 'token',
                               users: false,
                               data: true)
