# encoding: utf-8

require 'gooddata'

client = GoodData.conect('login', 'password')
project = client.projects('project_id')

project.data_permissions.pmap {|f| [f.related.login, f.pretty_expression]}