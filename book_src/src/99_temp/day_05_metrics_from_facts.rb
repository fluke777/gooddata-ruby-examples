# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    fact = project.facts('fact.commits.lines_changed')
    metric = fact.create_metric(:title => "Sum of [#{fact.identifier}]")
    metric.save
    res = metric.execute

    puts res
end