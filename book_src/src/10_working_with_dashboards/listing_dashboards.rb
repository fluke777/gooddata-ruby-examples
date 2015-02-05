# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |client|
    project = client.project(PROJECT_ID)

    # List all dashboards
    dashboards = project.dashboards
    pp dashboards
end