# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.create_project(title: 'New project',
                                template: 'https://secure.gooddata.com/projectTemplates/SuperSoda/1/',
                                auth_token: 'token')
