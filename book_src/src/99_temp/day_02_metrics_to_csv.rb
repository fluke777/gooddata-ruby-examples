# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
        metrics = project.metrics
        metrics.each do |metric|
            m = metric.pretty_expression
            puts m
            csv << [m]
        end
    end

    puts 'The CSV is ready!'
end