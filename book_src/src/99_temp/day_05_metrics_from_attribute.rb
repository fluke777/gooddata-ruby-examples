# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    attribute = project.attributes('attr.devs.dev_id')
    metric = attribute.create_metric(:title => "Count of [#{attribute.identifier}]")
    metric.save
    metric.execute
end