# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_pid')

project.invite('joe@example.com', 'admin', 'Hey Joe, look at this.')

